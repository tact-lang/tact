struct Inner {
    a: Int?;
    b: String;
    c: Bool?;
}

struct Outer {
    d: Inner;
    e: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            d: Inner{ a: null, b: "foo", c: true },
            e: false
        };
    }
}