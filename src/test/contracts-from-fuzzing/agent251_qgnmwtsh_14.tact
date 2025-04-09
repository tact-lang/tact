struct DefaultOptional {
    a: Int? = null;
    b: Bool? = null;
}

contract DefOpt {
    data: DefaultOptional;

    init() {
        self.data = DefaultOptional{};
    }
}