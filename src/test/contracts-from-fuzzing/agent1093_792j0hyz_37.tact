struct InnerMost {
    val1: Int = 11;
    val2: Bool = false;
}

struct Middle {
    inner: InnerMost;
}

contract DefaultsInStructsFixed {
    s: Middle;

    init() {
        self.s = Middle{ inner: InnerMost{} };
    }
}