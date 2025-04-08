struct Inner {
    a: Int;
    b: Int?;
    c: Bool;
}

struct Outer {
    d: Inner;
    e: Inner;
}

contract MultStruct {
    data: Outer;

    init() {
        self.data = Outer{
            d: Inner{ a: 1, b: null, c: true },
            e: Inner{ a: 2, b: 5, c: false },
        };
    }
}