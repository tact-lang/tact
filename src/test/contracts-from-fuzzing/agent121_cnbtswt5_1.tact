struct Inner {
    x: Int;
    y: String;
}

struct Outer {
    a: Int;
    b: Bool;
    c: Inner;
    d: String;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            a: 1,
            b: true,
            c: Inner{ x: 10, y: "str" },
            d: "outer"
        };
    }
}
