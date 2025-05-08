struct BigNested {
    x: Int;
    y: Bool;
    nested1: Nested1;
    nested2: Nested2;
}

struct Nested1 {
    a: Int;
    b: String;
    c: Bool?;
}

struct Nested2 {
    d: Int;
    e: String;
    f: Bool;
    g: DeepNested;
}

struct DeepNested {
    p: String;
    q: Int;
}

contract TestContract {
    data: BigNested;

    init() {
        self.data = BigNested{
            x: 42,
            y: true,
            nested1: Nested1{a: 1, b: "b", c: null},
            nested2: Nested2{
                d: 2, e: "e", f: false,
                g: DeepNested{p: "p", q: 3}
            }
        };
    }
}