struct OptionalLayer {
    deep: Int?;
}

contract OptionalStructContract {
    data: OptionalLayer;

    init() {
        self.data = OptionalLayer{ deep: null };
    }
}