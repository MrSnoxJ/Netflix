//
//  APICaller.swift
//  Netflix
//
//  Created by Yerasyl Sharipov on 19.04.2023.
//

import Foundation
struct Constant {
    static let API_KEY = "635353167fcdd51a8dee2a4f37c9c98e"
    static let link = "https://api.themoviedb.org"
}
enum APIError : Error {
case failedTogetData
}
class APICaller{
    static let shared = APICaller()
    
    
    
    func getTrendingMovies (completion : @escaping (Result<[title],Error>) -> Void ){
        
        guard let url = URL(string: "\(Constant.link)/3/trending/movie/day?api_key=\(Constant.API_KEY)")else{return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data ,_,error in
            
            guard let data = data, error == nil else{
                return
            }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
                
            } catch {
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    
    func getTrandingTvs (completion : @escaping (Result<[title],Error>) -> Void ){
        guard let url = URL(string: "\(Constant.link)/3/trending/tv/day?api_key=\(Constant.API_KEY)")else{return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data ,_,error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self,from: data)
                completion(.success(result.results))
                
            } catch {
                completion(.failure(APIError.failedTogetData))            }
            
        }
        task.resume()
    }
    func getUpcomingMovies(completion : @escaping (Result<[title],Error>) -> Void ){
        guard let url = URL(string: "\(Constant.link)/3/movie/upcoming?api_key=\(Constant.API_KEY)&language=en-US&page=1") else {return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data ,_,error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIError.failedTogetData))            }
            
        }
        task.resume()
    }
    func getPopularMovies(completion : @escaping (Result<[title],Error>) -> Void ){
        guard let url = URL(string: "\(Constant.link)/3/movie/popular?api_key=\(Constant.API_KEY)&language=en-US&page=1") else {return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data ,_,error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIError.failedTogetData))            }
            
        }
        task.resume()
        
    }
    func getTopRatedMovies(completion : @escaping (Result<[title],Error>) -> Void ){
        guard let url = URL(string: "\(Constant.link)/3/movie/top_rated?api_key=\(Constant.API_KEY)&language=en-US&page=1") else {return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data ,_,error in
            guard let data = data, error == nil else{
                return
            }
            do {
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            } catch {
                completion(.failure(APIError.failedTogetData))            }
            
        }
        task.resume()
        
    }
    
    
}

//https://api.themoviedb.org/3/movie/top_rated?api_key=<<api_key>>&language=en-US&page=1
