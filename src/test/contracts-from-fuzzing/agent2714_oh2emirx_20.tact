struct DefaultOptional {
    val: Int? = null;
}

contract Test20 {
    dopt: DefaultOptional;

    init() {
        self.dopt = DefaultOptional{};
    }
}