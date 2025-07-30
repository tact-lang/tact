contract OptNestedSerialized {
    foo: Outer;

    init() {
        self.foo = Outer{
            mid: Middle{
                innerOpt: null,
                z: 7
            },
            x: 42
        };
    }
}

struct Outer {
    mid: Middle;
    x: Int as uint64;
}

struct Middle {
    innerOpt: Inner?;
    z: Int as int8;
}

struct Inner {
    a: Int as uint8;
    b: Bool;
}
