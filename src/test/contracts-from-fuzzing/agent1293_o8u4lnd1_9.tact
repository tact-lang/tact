struct Inner {
    v: Int?;
}

struct Middle {
    inner: Inner?;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    description: String?;
}

contract MixedDepth {
    record: Outer;

    init() {
        self.record = Outer{
            middle: Middle{
                inner: null,
                flag: true
            },
            description: "foo"
        };
    }
}