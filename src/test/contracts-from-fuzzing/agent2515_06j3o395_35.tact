struct InnerD {
    x: Int = 1;
}

struct MidD {
    inner: InnerD = InnerD{x: 2};
}

contract LayeredDefaults {
    m: MidD = MidD{inner: InnerD{x: 3}};

    init() {
        self.m = MidD{inner: InnerD{x: 42}};
    }
}
