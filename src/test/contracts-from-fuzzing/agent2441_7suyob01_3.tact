struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Int;
    y: Inner;
    z: String?;
}

contract DeepNest {
    param: Outer;

    init() {
        self.param = Outer{
            x: 5,
            y: Inner{
                a: 10,
                b: true,
            },
            z: null,
        };
    }
}