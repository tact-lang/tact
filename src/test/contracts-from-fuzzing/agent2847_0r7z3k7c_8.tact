struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

struct Middle {
    a: Inner;
    b: String;
}

struct Outer {
    u: Middle;
    v: Bool;
}

contract DeepOptional {
    s: Outer?;

    init() {
        self.s = Outer{
            u: Middle{
                a: Inner{
                    x: 7,
                    y: false,
                    z: "hi",
                },
                b: "middle",
            },
            v: true,
        };
    }
}