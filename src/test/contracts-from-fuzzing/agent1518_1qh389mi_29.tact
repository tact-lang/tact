struct DefaultOptional {
    a: Int? = null;
    b: Bool? = null;
}

contract DefaultOpt {
    val: DefaultOptional;

    init() {
        self.val = DefaultOptional{};
    }
}