//
//  Movie.swift
//  Netflix
//
//  Created by Yerasyl Sharipov on 19.04.2023.
//

import Foundation
struct TrendingTitleResponse : Codable{
    let results : [title]
}
struct title : Codable {
    let id : Int
    let media_type : String?
    let original_name : String?
    let original_title : String?
    let poster_path : String?
    let overview : String?
    let vote_count : Int
    let release_date : String?
    let vote_average : Double
}
/*
 {
adult = 0;
"backdrop_path" = "/qElNES0sHVQcbzvGrTx7ccpGzij.jpg";
"genre_ids" =             (
 878,
 28,
 18
);
id = 842675;
"media_type" = movie;
"original_language" = zh;
"original_title" = "\U6d41\U6d6a\U5730\U74032";
overview = "Humans built huge engines on the surface of the earth to find a new home. But the road to the universe is perilous. In order to save earth, young people once again have to step forward to start a race against time for life and death.";
popularity = "198.506";
"poster_path" = "/pR858ihc6Ls9xohpdRJVjV787ml.jpg";
"release_date" = "2023-01-22";
title = "The Wandering Earth II";
video = 0;
"vote_average" = "7.731";
"vote_count" = 145;
}
 */
