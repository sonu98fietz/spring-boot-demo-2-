package com.sa.springbootmvcjspjpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sa.springbootmvcjspjpa.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

}
