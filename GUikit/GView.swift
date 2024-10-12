import SwiftUI

public struct GView<LoadingView: View, SuccessView: View, ErrorView: View, T>: View {
    var state: ViewState<T>
    var loadingView: () -> LoadingView
    var successView: (T) -> SuccessView
    var errorView: (Error) -> ErrorView

    // Inicializador usando genéricos diferentes para cada estado
    public init(
        state: ViewState<T>,
        loadingView: @escaping () -> LoadingView,
        successView: @escaping (T) -> SuccessView,
        errorView: @escaping (Error) -> ErrorView
    ) {
        self.state = state
        self.loadingView = loadingView
        self.successView = successView
        self.errorView = errorView
    }
    
    public var body: some View {
        switch state {
        case .loading:
            loadingView()
        case .success(let data):
            successView(data)
        case .error(let error):
            errorView(error)
        }
    }
}
