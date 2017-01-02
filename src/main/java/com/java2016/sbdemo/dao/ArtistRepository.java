package com.java2016.sbdemo.dao;

import com.java2016.sbdemo.domain.Artist;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Omri at 04/04/2016 11:24
 */
@Repository
public interface ArtistRepository extends CrudRepository<Artist,Long> {
  List<Artist> findByNameContaining(String q, Pageable p);
}

