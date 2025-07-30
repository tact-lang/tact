struct Outermost {
    a: InnerMost;
}

struct InnerMost {
    b: Int;
    c: Int;
}

contract OutIn {
    x: Outermost;

    init() {
        self.x = Outermost{ a: InnerMost{ b: 123, c: 456 } };
    }
}