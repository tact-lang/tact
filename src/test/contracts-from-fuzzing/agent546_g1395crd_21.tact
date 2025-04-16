struct OneFieldOpt {
    a: Int?;
}

contract HasOneOpt {
    f: OneFieldOpt;

    init() {
        self.f = OneFieldOpt{ a: null };
    }
}