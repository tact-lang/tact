struct Inner {
    a: Int;
    b: Bool;
}

struct Middle {
    i: Int;
    optInner: Inner?;
}

struct Outer {
    middle: Middle;
    s: String;
}

contract DeepStructTest {
    outer: Outer;

    init() {
        self.outer = Outer{
            middle: Middle{
                i: 1,
                optInner: Inner{
                    a: 42,
                    b: true,
                },
            },
            s: "test",
        };
    }
}