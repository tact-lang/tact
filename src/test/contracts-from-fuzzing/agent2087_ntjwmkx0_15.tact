struct OneFieldOpt {
    field: Int?;
}

struct SecondLayer {
    inner: OneFieldOpt;
}

contract NullDeeper {
    f: SecondLayer;

    init() {
        self.f = SecondLayer{ inner: OneFieldOpt{field:null} };
    }
}