struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

struct Outer {
    inner: Inner;
    a: Int;
    b: Bool;
    s: String;
}

contract EverythingCombined {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{ x: 1, y: false, z: "inner" },
            a: 2,
            b: true,
            s: "outer"
        };
    }
}