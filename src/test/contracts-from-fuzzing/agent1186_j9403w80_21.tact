struct Inner {
    i: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract ThreeLevelDeep {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    i: 99,
                },
            },
        };
    }
}
