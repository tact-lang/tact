struct VeryNested {
    foo: Bool;
    bar: Int;
}

struct Wrapper {
    inner: VeryNested;
    optionalInner: VeryNested?;
}

contract TestExtreme {
    param: Wrapper;

    init() {
        self.param = Wrapper{
            inner: VeryNested{foo: false, bar: -1},
            optionalInner: null,
        };
    }
}