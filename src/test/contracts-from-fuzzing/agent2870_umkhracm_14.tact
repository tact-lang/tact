struct InnerOptional {
    foo: Int?;
}

struct Middle {
    inner: InnerOptional?;
}

contract Test {
    nestedOpt: Middle;

    init() {
        self.nestedOpt = Middle{
            inner: null
        };
    }
}
