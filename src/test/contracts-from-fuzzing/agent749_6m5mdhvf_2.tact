struct Inner {
    a: Int;
    b: Bool?;
    c: String;
}

struct Outer {
    nested: Inner;
    d: Int?;
}

contract Combo {
    state: Outer;

    init() {
        self.state = Outer{
            nested: Inner{ a: 7, b: true, c: "abc" },
            d: null
        };
    }
}