struct Outer {
    x: Int;
    inner: Inner;
}

struct Inner {
    y: Int?;
    z: Bool?;
}

contract NestedOption {
    nested: Outer;

    init() {
        self.nested = Outer{
            x: 50,
            inner: Inner{
                y: null,
                z: null
            }
        };
    }
}