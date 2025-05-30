struct Param {
    s: String;
}

struct Wrap {
    inner: Param;
    optInner: Param?;
}

contract OptNestedStructs {
    param: Wrap;

    init() {
        self.param = Wrap{
            inner: Param{ s: "Hi" },
            optInner: null
        };
    }
}