struct DefaultedOptional {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultedOpt {
    data: DefaultedOptional;

    init() {
        self.data = DefaultedOptional{};
    }
}