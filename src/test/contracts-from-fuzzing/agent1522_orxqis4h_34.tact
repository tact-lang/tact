struct InnerMost {
    foo: Int;
}

struct InnerOpt {
    a: InnerMost?;
    b: Int;
}

struct MiddleOpt {
    a: InnerOpt?;
    b: Int;
}

contract OptStructNested {
    state: MiddleOpt;

    init() {
        self.state = MiddleOpt{
            a: null,
            b: 42,
        };
    }

    receive() {
        let _ = self.state;
    }
}