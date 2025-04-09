struct Inner {
    val1: Int;
    val2: Bool;
}

struct Middle {
    nested: Inner;
    optionalInner: Inner?;
}

struct Outer {
    deep: Middle;
    optMiddle: Middle?;
}

contract DeeplyOptional {
    storage: Outer;

    init() {
        self.storage = Outer{
            deep: Middle{
                nested: Inner{
                    val1: 5,
                    val2: true,
                },
                optionalInner: null,
            },
            optMiddle: null,
        };
    }
}
