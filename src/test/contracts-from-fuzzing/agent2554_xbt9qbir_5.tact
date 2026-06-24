struct Inner {
    x: Int?;
    y: Bool;
    z: String?;
}

struct Outer {
    foo: Int;
    inner: Inner;
}

contract StructNest {
    s: Outer;

    init() {
        self.s = Outer{
            foo: 5,
            inner: Inner{
                x: null,
                y: true,
                z: null
            }
        };
    }
}