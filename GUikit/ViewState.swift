public enum ViewState<T> {
    case loading
    case success(T)
    case error(Error)
}
