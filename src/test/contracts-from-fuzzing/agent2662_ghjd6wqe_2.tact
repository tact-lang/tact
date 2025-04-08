struct Inner {
    x: Int;
    y: String?;
}

struct Middle {
    a: Bool;
    b: Inner;
}

struct Outer {
    z: Int;
    m: Middle;
}

contract DeepNested {
    val: Outer;

    init() {
        self.val = Outer{
            z: 5,
            m: Middle{
                a: false,
                b: Inner{
                    x: 123,
                    y: "test",
                },
            },
        };
    }
}