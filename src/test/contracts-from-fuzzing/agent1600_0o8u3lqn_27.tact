struct DefaultOption {
    a: Int? = null;
    b: Bool? = null;
}

contract DefOptContract {
    data: DefaultOption;

    init() {
        self.data = DefaultOption{};
    }
}