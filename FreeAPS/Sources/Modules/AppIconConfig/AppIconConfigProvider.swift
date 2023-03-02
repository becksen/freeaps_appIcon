extension AppIconConfig {
    final class Provider: BaseProvider, AppIconConfigProvider {}
    /* final class Provider: BaseProvider, AutotuneConfigProvider {
         @Injected() private var apsManager: APSManager!

         var appicon: AppIcon? {
             storage.retrieve(OpenAPS.Settings.autotune, as: AppIcon.self)
         }

         func runAutotune() -> AnyPublisher<AppIcon?, Never> {
             apsManager.autotune()
         }

         func deleteAutotune() {
             storage.remove(OpenAPS.Settings.autotune)
         }
     } */
}
