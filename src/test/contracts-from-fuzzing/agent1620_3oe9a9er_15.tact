struct W {
    u: Int;
}

struct X {
    w: W;
    z: Int;
}

struct Y {
    x: X?;
    y: String?;
}

contract OptionalNestedOverride {
    foo: Y;

    init() {
        self.foo = Y{
            x: X{
                w: W{u: 2},
                z: 3
            },
            y: "hi"
        };
    }
}