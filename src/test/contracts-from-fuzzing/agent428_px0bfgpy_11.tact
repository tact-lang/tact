struct Inner {
    a: Int;
    b: Bool;
    c: String?;
}

struct Outer {
    inner: Inner;
    d: Int; 
    e: Bool?;
}

contract ComplexStructs {
    x: Outer;

    init() {
        self.x = Outer{
            inner: Inner{ a: 5, b: true, c: null },
            d: 7,
            e: false
        };
    }
}
