import SwiftUI
import Swinject

extension AppIconConfig {
    struct RootView: BaseView {
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

        var body: some View {
            Form {
                Section {
                    Toggle("Connect to Apple Health", isOn: $state.useAppIcon)
                    HStack {
                        Image(systemName: "pencil.circle.fill")
                        Text(
                            "After you create glucose records in the Health app, please open FreeAPS X to help us guaranteed transfer changed data"
                        )
                        .font(.caption)
                    }
                    .foregroundColor(Color.secondary)
                    HStack {
                        Image(systemName: "exclamationmark.circle.fill")
                        Text("For write data to Apple Health you must give permissions in Settings > Health > Data Access")
                            .font(.caption)
                    }
                }
            }
            .onAppear(perform: configureView)
            .navigationTitle("AppIcon Change")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}
