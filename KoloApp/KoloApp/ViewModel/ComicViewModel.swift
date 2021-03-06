//
//  ComicViewModel.swift
//  KoloApp
//
//  Created by Jefin on 11/05/22.
//

import Combine
import Foundation

protocol ComicViewable {
  func getComics() -> AnyPublisher<[ComicResults]?, Error>
}
class ComicViewModel: ComicViewable {
    
    private let marvelService: MarvelService
    var subscriptions = Set<AnyCancellable>()
    var filterType = ""
    
    init(marvelService: MarvelService) {
        self.marvelService = marvelService
    }
    
    func getComics() -> AnyPublisher<[ComicResults]?, Error> {
        marvelService.getComics(filterType: filterType)
            .map(\.data?.results)
            .eraseToAnyPublisher()
    }
}
