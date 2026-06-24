struct SDefaultOpt {
    a: Int? = null;
    b: String? = null;
}

contract DefaultedOptional {
    s: SDefaultOpt;

    init() {
        self.s = SDefaultOpt{}; // should use defaults
    }
}
