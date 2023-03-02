import Combine
import SwiftUI

extension AppIconConfig {
    final class StateModel: BaseStateModel<Provider> {
        @Published var useAppIcon = false
        @Published var publishedDate = Date()
        @Injected() var apsManager: APSManager!
        // @Published var useAutotune = false
        @Published var appicon: AppIcon?
        private(set) var units: GlucoseUnits = .mmolL
        // @Published var publishedDate = Date()
        @Persisted(key: "lastAutotuneDate") private var lastAutotuneDate = Date() {
            didSet {
                DispatchQueue.main.async {
                    self.publishedDate = self.lastAutotuneDate
                }
            }
        }

        /* override func subscribe() {
             appicon = provider.appicon
             units = settingsManager.settings.units
             useAppIcon = settingsManager.settings.appicon
             publishedDate = lastAutotuneDate

             $useAppIcon
                 .removeDuplicates()
                 .flatMap { [weak self] use -> AnyPublisher<Bool, Never> in
                     guard let self = self else {
                         return Just(false).eraseToAnyPublisher()
                     }
                     self.settingsManager.settings.useAutotune = use
                     return self.apsManager.makeProfiles()
                 }
                 .cancellable()
                 .store(in: &lifetime)
         } */

        /* func run() {
             provider.runAutotune()
                 .receive(on: DispatchQueue.main)
                 .flatMap { [weak self] result -> AnyPublisher<Bool, Never> in
                     guard let self = self else {
                         return Just(false).eraseToAnyPublisher()
                     }
                     self.autotune = result
                     return self.apsManager.makeProfiles()
                 }
                 .sink { [weak self] _ in
                     self?.lastAutotuneDate = Date()
                 }.store(in: &lifetime)
         } */

        /* func delete() {
             provider.deleteAutotune()
             appicon = nil
             apsManager.makeProfiles()
                 .cancellable()
                 .store(in: &lifetime)
         } */
    }
}
