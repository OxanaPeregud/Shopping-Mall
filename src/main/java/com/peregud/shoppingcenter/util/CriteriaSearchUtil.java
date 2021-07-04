package com.peregud.shoppingcenter.util;

import com.peregud.shoppingcenter.model.Shop;
import com.peregud.shoppingcenter.model.Shop_;
import lombok.experimental.UtilityClass;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

@UtilityClass
public class CriteriaSearchUtil {

    public String[] minimumDiscount(int minimumDiscount) {
        EntityManager entityManager = HibernateUtil.createEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Shop> criteriaQuery = criteriaBuilder.createQuery(Shop.class);
        Root<Shop> root = criteriaQuery.from(Shop.class);
        criteriaQuery.select(root)
                .where(criteriaBuilder.gt(root.get(Shop_.discount), minimumDiscount));
        TypedQuery<Shop> query = entityManager.createQuery(criteriaQuery);
        List<Shop> resultList = query.getResultList();
        String[] result = new String[resultList.size()];
        for (int i = 0; i < resultList.size(); i++) {
            result[i] = String.valueOf(resultList.get(i));
        }
        entityManager.close();
        return result;
    }

    public String[] shopKeywords(String search) {
        EntityManager entityManager = HibernateUtil.createEntityManager();
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<Shop> criteriaQuery = criteriaBuilder.createQuery(Shop.class);
        Root<Shop> root = criteriaQuery.from(Shop.class);
        Predicate predicate1 = criteriaBuilder
                .like(criteriaBuilder.upper(root.get(Shop_.name)), "%" + search.toUpperCase() + "%");
        Predicate predicate2 = criteriaBuilder
                .like(criteriaBuilder.upper(root.get(Shop_.description)), "%" + search.toUpperCase() + "%");
        criteriaQuery.select(root)
                .where(criteriaBuilder.or(predicate1, predicate2));
        TypedQuery<Shop> query = entityManager.createQuery(criteriaQuery);
        List<Shop> resultList = query.getResultList();
        String[] result = new String[resultList.size()];
        for (int i = 0; i < resultList.size(); i++) {
            result[i] = String.valueOf(resultList.get(i));
        }
        entityManager.close();
        return result;
    }
}
