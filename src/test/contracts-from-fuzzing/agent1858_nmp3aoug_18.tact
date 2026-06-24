struct SDefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String = "x";
}

contract DefaultOptional {
    s: SDefaultOpt;
    init() {
        self.s = SDefaultOpt{};
    }
}