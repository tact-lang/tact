struct DefaultOption {
    a: Int? = null;
    b: Bool = true;
}

contract Defaulted {
    data: DefaultOption;

    init() {
        self.data = DefaultOption{};
    }
}