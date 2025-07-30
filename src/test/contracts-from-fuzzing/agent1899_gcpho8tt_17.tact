struct DefaultOption {
    s: String? = null;
    b: Bool? = true;
}

contract DefaultOptionalContract {
    data: DefaultOption;

    init() {
        self.data = DefaultOption{};
    }
}