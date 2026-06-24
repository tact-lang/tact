struct SDefaultOpt {
    a: Int = 2;
    b: Int?;
    c: Int? = 3;
}

contract DefaultsVsOptional {
    s: SDefaultOpt;

    init() {
        self.s = SDefaultOpt{};
    }
}