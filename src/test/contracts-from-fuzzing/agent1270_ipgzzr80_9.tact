struct ComplexNested {
    a: Int;
    b: Bool?;
    c: String;
    d: Inner;
}

struct Inner {
    x: Int;
    y: String?;
}

contract TestContract {
    var1: ComplexNested;

    init() {
        self.var1 = ComplexNested{
            a: 1,
            b: null,
            c: "ok",
            d: Inner{
                x: 42,
                y: null
            }
        };
    }
}