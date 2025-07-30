struct Mid {
    i: Int;
    s: String;
}

struct Outer {
    a: Int;
    m: Mid;
    b: Bool?;
}

contract NestedMixed {
    field: Outer;

    init() {
        self.field = Outer{
            a: 5,
            m: Mid { i: 10, s: "hello" },
            b: null
        };
    }

    receive() {}
}