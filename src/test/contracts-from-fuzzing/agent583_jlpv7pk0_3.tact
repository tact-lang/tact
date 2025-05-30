struct Inner {
    a: Int;
    b: Bool;
    c: String;
}

struct Outer {
    x: Inner;
    y: Int?;
    z: Bool?;
}

contract NestedStorage {
    s: Outer;

    init() {
        self.s = Outer{
            x: Inner{
                a: 42,
                b: true,
                c: "ok"
            },
            y: null,
            z: true
        };
    }
}