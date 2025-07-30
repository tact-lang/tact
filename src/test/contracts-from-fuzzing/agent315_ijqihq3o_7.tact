struct Inner {
    val: Int;
}

struct Middle {
    inner: Inner;
    optionalInner: Inner?;
}

struct Outer {
    middle: Middle;
    optionalMiddle: Middle?;
}

contract RecursiveShape {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{val: 1},
                optionalInner: null,
            },
            optionalMiddle: null,
        };
    }
}