struct InnerMost {
    flag: Bool;
}

struct Inner {
    optInnerMost: InnerMost?;
    value: Int;
}

struct Wrapper {
    field: Inner;
    optInner: Inner?;
}

contract DeepOption {
    data: Wrapper = Wrapper{
        field: Inner{ optInnerMost: null, value: 5 },
        optInner: null
    };
}