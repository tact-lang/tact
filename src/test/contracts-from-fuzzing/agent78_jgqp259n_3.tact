struct Inner {
    x: Int;
    y: Bool;
    z: Int?;
}

struct Middle {
    inner: Inner;
    optionalInner: Inner?;
    flag: Bool;
}

contract OptionalNested {
    middle: Middle?;

    init() {
        self.middle = Middle {
            inner: Inner {
                x: 10,
                y: true,
                z: null,
            },
            optionalInner: null,
            flag: false,
        };
    }
}