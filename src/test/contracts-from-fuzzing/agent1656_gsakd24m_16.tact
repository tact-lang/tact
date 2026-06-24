struct InnerMost {
    a: Int;
}
struct Inner {
    x: InnerMost;
    y: Int;
}
struct Outer {
    point: Inner;
    name: String;
    flag: Bool;
}

contract NestedVariant {
    inf: Outer;

    init() {
        self.inf = Outer {
            point: Inner {
                x: InnerMost { a: 42 },
                y: 7
            },
            name: "abc",
            flag: false
        };
    }
}