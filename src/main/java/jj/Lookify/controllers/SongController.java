package jj.Lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import jj.Lookify.models.Song;
import jj.Lookify.services.SongService;


@Controller
public class SongController {
    private final SongService SongService;
    
    public SongController(SongService SongService) {
        this.SongService = SongService;
    }
    
    @RequestMapping("/")
    public String landing(Model model) {
    	return "/lookify/landing.jsp";
    }
    
    @RequestMapping("/dashboard")
    public String index(Model model) {
        List<Song> Songs = SongService.allSongs();

        model.addAttribute("Songs", Songs);
        return "/lookify/index.jsp";
    }
    
    @RequestMapping(value="/add")
    public String add(@ModelAttribute("song") Song song) {
		return "/lookify/new.jsp";
    }
    
    @RequestMapping(value="/create", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("song") Song song, BindingResult result) {
    	if (result.hasErrors()) {
          return "/lookify/new.jsp";
      } else {
      	SongService.createSong(song);
          return "redirect:/dashboard";
      }
    }
    
   

  
    @RequestMapping("/show/{id}")
    public String show(@PathVariable("id") Long id,Model model) {
    	Song song = SongService.findSong(id);
        model.addAttribute("song", song);
        return "/lookify/show.jsp";
    }

    
    @RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
    	System.out.println(id);
    	SongService.deleteSong(id);
        return "redirect:/dashboard";
    }
    
    
    
    @RequestMapping(value="/search/", method=RequestMethod.POST) 
    public String search(Model model,@RequestParam(value="search") String search) {
		System.out.println(search);
    	

    	return "redirect:/search/" + search;	
    }
    
    	
    	  @RequestMapping(value="/search/{search}")
    public String showArtist(Model model,@PathVariable("search") String search) {
    	List<Song> songsByArtist = SongService.artistSearch(search);

    	model.addAttribute("searched", search);
    	
        model.addAttribute("songsByArtist", songsByArtist);
    
        return "/lookify/artistSearch.jsp";
}
    	  
    	  @GetMapping(value="/topTen")
    public String topTen(Model model) {
    		  
    		  List<Song> Songs = SongService.topTenSearch();

    	        model.addAttribute("Songs", Songs);

    		  return "/lookify/topTen.jsp";
	}


}