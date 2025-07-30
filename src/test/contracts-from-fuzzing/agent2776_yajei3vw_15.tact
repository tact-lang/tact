struct InnerMost {
    a: Int;
}

struct Mid {
    midField: InnerMost?;
}

struct Top {
    topField: Mid?;
}

contract ComplexOptionals {
    top: Top;

    init() {
        self.top = Top{ topField: null };
    }
}
