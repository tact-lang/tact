struct InnerMost {
    x: Int;
}

struct InnerOpt {
    im: InnerMost?;
}

struct Wrapper {
    inner: InnerOpt;
}

contract NestedOptChain {
    data: Wrapper;

    init() {
        self.data = Wrapper{ inner: InnerOpt{ im: InnerMost{ x: 42 } } };
    }
}
