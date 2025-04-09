struct Outer {
    nested: Inner;
    i: Int;
    b: Bool;
}

struct Inner {
    s: String;
    j: Int;
}

contract NestedInterleaved {
    x: Outer;

    init() {
        self.x = Outer{
            nested: Inner{ s: "xyz", j: 77 },
            i: 100,
            b: true,
        };
    }
}
