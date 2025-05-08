struct InnerStr {
    p: Int;
    q: String;
}

contract ArrayOfStructs {
    s1: InnerStr = InnerStr{ p: 1, q: "a" };
    s2: InnerStr = InnerStr{ p: 2, q: "b" };
    s3: InnerStr = InnerStr{ p: 3, q: "c" };
    s4: InnerStr = InnerStr{ p: 4, q: "d" };
    s5: InnerStr = InnerStr{ p: 5, q: "e" };

    init() {
        self.s1 = InnerStr{ p: 11, q: "x" };
        self.s5 = InnerStr{ p: 55, q: "y" };
    }
}