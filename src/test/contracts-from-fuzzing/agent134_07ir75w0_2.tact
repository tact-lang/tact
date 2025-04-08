struct Inner {
    a: Int;
    b: Int?;
}

struct Middle {
    x: Bool;
    inner: Inner;
}

struct Outer {
    middle: Middle;
    flag: Bool;
}

contract DeepNest {
    field: Outer;

    init() {
        self.field = Outer{
            middle: Middle{
                x: true,
                inner: Inner{
                    a: 1,
                    b: null,
                },
            },
            flag: false,
        };
    }
}
