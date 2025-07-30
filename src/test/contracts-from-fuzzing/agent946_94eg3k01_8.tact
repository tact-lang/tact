struct Inner {
    a: Int;
    b: Bool?;
}

struct Middle {
    x: Int;
    y: Inner;
    z: Bool;
}

contract TestContract {
    outer: Middle?;

    init() {
        self.outer = Middle{
            x: 13,
            y: Inner{
                a: 7,
                b: null,
            },
            z: true,
        };
    }
}