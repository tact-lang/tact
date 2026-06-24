struct Inner {
    value: Int?;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract DeepNest {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    value: null,
                },
            },
        };
    }
}