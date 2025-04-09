struct Inner {
    value: Int;
    optionalBool: Bool?;
}

struct Middle {
    inner: Inner;
    optionalInner: Inner?;
}

struct Outer {
    middle: Middle;
    optionalMiddle: Middle?;
}

contract MultiLayerNested {
    storage: Outer;

    init() {
        self.storage = Outer{
            middle: Middle{
                inner: Inner{value: 0, optionalBool: null},
                optionalInner: null
            },
            optionalMiddle: null
        };
    }
}