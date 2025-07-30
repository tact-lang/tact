struct InnerD {
    a: Int = 5;
    b: Bool = true;
    c: String = "x";
}

struct OuterD {
    inner: InnerD;
    m: Int = 77;
}

contract DefaultsNested {
    state: OuterD;

    init() {
        self.state = OuterD{
            inner: InnerD{ a: 10, b: false, c: "y" },
            m: 88
        };
    }
}