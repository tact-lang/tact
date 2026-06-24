struct WrappedOpt {
    optBool: Bool?;
}

struct Container {
    inner: WrappedOpt;
    inner2: WrappedOpt;
    inner3: WrappedOpt;
}

contract Test {
    c: Container;

    init() {
        self.c = Container{
            inner: WrappedOpt{ optBool: true },
            inner2: WrappedOpt{ optBool: null },
            inner3: WrappedOpt{ optBool: false }
        };
    }
}
// Contract persistent state has repeated nested optionals