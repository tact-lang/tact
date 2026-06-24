struct InnerWithDefault {
    v1: Int;
    flag: Bool = false;
}

struct HasInnerDefault {
    inner: InnerWithDefault;
    number: Int = 5;
}

contract TestDefaults {
    s: HasInnerDefault;

    init() {
        self.s = HasInnerDefault{
            inner: InnerWithDefault{
                v1: 10,
            },
        };
    }
}
