struct Inner {
    z: Int;
}

struct Middle {
    y: Inner;
}

struct Outer {
    x: Middle?;
}

contract NestedOptionals {
    obj: Outer;

    init() {
        self.obj = Outer{ x: Middle{ y: Inner{ z: 42 } } };
    }
}