struct DefaultAndOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefOpt {
    data: DefaultAndOpt;

    init() {
        self.data = DefaultAndOpt{};
    }
}