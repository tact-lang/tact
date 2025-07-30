struct StrNest {
    a: Int;
    b: Sub?;
}

struct Sub {
    s: String?;
    b: Bool;
}

contract Test {
    f: StrNest;

    init() {
        self.f = StrNest{
            a: 1,
            b: Sub{
                s: "hello",
                b: true
            }
        };
    }
}