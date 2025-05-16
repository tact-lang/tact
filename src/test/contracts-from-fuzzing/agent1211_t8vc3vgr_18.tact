struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

struct Middle {
    a: Int;
    inner: Inner;
}

struct Outer {
    b: Bool;
    middle: Middle;
}

contract ThreeLayers {
    val: Outer;
    init() {
        self.val = Outer{
            b: true,
            middle: Middle{
                a: 12,
                inner: Inner{
                    x: 34,
                    y: false,
                    z: "deep",
                },
            },
        };
    }
}