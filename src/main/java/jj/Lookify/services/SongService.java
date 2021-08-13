package jj.Lookify.services;

import java.util.List;
import org.springframework.stereotype.Service;

import jj.Lookify.models.Song;
import jj.Lookify.repositories.SongRepository;
@Service
public class SongService {
   
    private final SongRepository SongRepository;
    
    public SongService(SongRepository SongRepository) {
        this.SongRepository = SongRepository;
    }
  
    public List<Song> allSongs() {
        return SongRepository.findAll();
    }

    public Song createSong(Song b) {
        return SongRepository.save(b);
    }
   
    public Song findSong(Long id) {
    	return this.SongRepository.findById(id).orElse(null);
    }
    
    public void deleteSong(Long id) {
    	this.SongRepository.deleteById(id);
    }
    
    public Song updateSong(Song b) {
    	
    	return SongRepository.save(b);
    } 
    
    public List<Song> artistSearch(String artist) {
        return SongRepository.findByArtistLike(artist);
    } 
    
    public List<Song> topTenSearch() {
        return SongRepository.findAllOrderByRatingDesc();
    } 
    
//    findAllOrderByRatingDesc
}