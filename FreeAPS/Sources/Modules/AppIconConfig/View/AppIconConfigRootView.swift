import SwiftUI
import Swinject

extension AppIconConfig {
    /*     struct RootView: BaseView {
     let resolver: Resolver
     @StateObject var state = StateModel()

     private var isfFormatter: NumberFormatter {
     let formatter = NumberFormatter()
     formatter.numberStyle = .decimal
     formatter.maximumFractionDigits = 2
     return formatter
     }

     private var rateFormatter: NumberFormatter {
     let formatter = NumberFormatter()
     formatter.numberStyle = .decimal
     formatter.maximumFractionDigits = 2
     return formatter
     }

     private var dateFormatter: DateFormatter {
     let formatter = DateFormatter()
     formatter.dateStyle = .medium
     formatter.timeStyle = .short
     return formatter
     }

     func GetAppIcon(isPrimary: Bool) -> UIImage {
     var appIcon: UIImage! {
     if isPrimary == true {
     guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
     let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? [String: Any],
     let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? [String],
     let lastIcon = iconFiles.last else { return nil }
     return UIImage(named: lastIcon)
     } else {
     guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? [String: Any],
     let alternateIconsDictionary = iconsDictionary["CFBundleAlternateIcons"] as? [String: Any],
     let altIconName = alternateIconsDictionary["AppIconAlternate1"] as? [String: Any],
     let iconFiles = altIconName["CFBundleIconFiles"] as? [String],
     let lastIcon = iconFiles.last else { return nil }
     return UIImage(named: lastIcon)
     }
     }

     return appIcon
     }

     @AppStorage("active_icon") var activeAppIcon: String = "AppIcon"
     var body: some View {
     NavigationStack {
     Picker(selection: $activeAppIcon) {
     let customIcons: [String] = ["AppIcon", "AppIcon_BW"]
     ForEach(customIcons, id: \.self) { icon in
     Text(icon)
     .tag(icon)
     }
     } label: {}
     .navigationTitle("Alternative App Icon")
     }
     .onChange(of: activeAppIcon) { newValue in
     UIApplication.shared.setAlternateIconName(newValue)
     }

     /*
      Form {
      Section {
      // Toggle("Connect to Apple Health", isOn: $state.useAppIcon)

      HStack {
      // Image(systemName: "pencil.circle.fill")
      // Image(uiImage: UIImage(named: GetAppIcon().String) ?? UIImage())
      Image(uiImage: GetAppIcon(isPrimary: false))
      Text(
      "Default AppIcon"
      )
      // .font(.caption)
      }
      // .foregroundColor(Color.secondary)
      HStack {
      Image(systemName: "exclamationmark.circle.fill")
      Text("For write data to Apple Health you must give permissions in Settings > Health > Data Access")
      .font(.caption)
      }
      }*/
     }

     /* .onAppear(perform: configureView)
      .navigationTitle("AppIcon Change")
      .navigationBarTitleDisplayMode(.automatic)*/
     }
     } */

    struct ContentView: View {
        @AppStorage("active_icon") var activeAppIcon: String = "AppIcon"
        var body: some View {
            NavigationStack {
                Picker(selection: $activeAppIcon) {
                    let customIcons: [String] = ["AppIcon", "AppIcon_BW"]
                    ForEach(customIcons, id: \.self) { icon in
                        Text(icon)
                            .tag(icon)
                    }
                } label: {}
                    .navigationTitle("Alternative App Icon")
            }

            .onChange(of: activeAppIcon) {
                newValue in
                if newValue == "AppIcon" {
                    UIApplication.shared.setAlternateIconName(nil)
                } else {
                    UIApplication.shared.setAlternateIconName(newValue)
                }

                // activeAppIcon = newValue
            }
        }

        /* .onAppear(perform: configureView)
         .navigationTitle("AppIcon Change")
         .navigationBarTitleDisplayMode(.automatic)*/
    }
}
