struct SDefaultOpt {
    x: Int = 0;
    y: String? = null;
}

contract DefaultOptContract {
    foo: SDefaultOpt;

    init() {
        self.foo = SDefaultOpt{};
    }
}