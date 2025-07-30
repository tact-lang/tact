struct DefaultAndSomeOpt {
    a: Int = 42;
    b: Bool?;
    c: String?;
}

contract DefaultOptMix {
    f: DefaultAndSomeOpt;
    init() {
        self.f = DefaultAndSomeOpt{};
    }
}