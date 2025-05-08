struct Inner {
    x: Int;
}

struct Middle {
    y: Inner;
}

struct Outer {
    z: Middle;
}

contract Test3 {
    nested: Outer;

    init() {
        self.nested = Outer{
            z: Middle{
                y: Inner{
                    x: 7,
                },
            },
        };
    }

    receive() {}
}