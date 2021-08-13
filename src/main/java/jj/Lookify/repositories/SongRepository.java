package jj.Lookify.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import jj.Lookify.models.Song;


@Repository
public interface SongRepository extends CrudRepository<Song, Long>{
    
    List<Song> findAll();
    
    List<Song> findByArtistLike(String string);
    
   @Query(value = "SELECT * FROM songs ORDER BY rating DESC", nativeQuery = true)
    List<Song> findAllOrderByRatingDesc();

    
}