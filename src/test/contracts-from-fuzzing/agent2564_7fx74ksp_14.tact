struct InnerMost {
    i: Int;
}

struct Middle {
    im: InnerMost;
}

struct Outer {
    m: Middle;
}

contract SerialChain {
    data: Outer;

    init() {
        self.data = Outer{ m: Middle{ im: InnerMost{ i: 7 } } };
    }
}