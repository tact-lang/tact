struct Inner {
    x: Int;
    y: Bool;
}

struct Middle {
    i: Int?;
    inner: Inner;
}

struct Outer {
    name: String;
    middle: Middle;
    flag: Bool;
}

contract DeepNest {
    nested: Outer;

    init() {
        self.nested = Outer{
            name: "deep",
            middle: Middle{
                i: null,
                inner: Inner{
                    x: 10,
                    y: true,
                }
            },
            flag: false,
        };
    }
}