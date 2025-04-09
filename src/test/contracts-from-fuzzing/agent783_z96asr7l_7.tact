struct InnerMost {
    a: Int;
    b: Bool;
}

struct MiddleOpt {
    inner: InnerMost?;
}

struct OutMost {
    mid: MiddleOpt;
}

contract NullInnerStructTest {
    data: OutMost;

    init() {
        self.data = OutMost {
            mid: MiddleOpt { inner: null } 
        };
    }
}