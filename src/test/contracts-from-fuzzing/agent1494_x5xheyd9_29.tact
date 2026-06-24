struct DeeplyNested {
    a: Int;
    inner: MiddleNested;
}

struct MiddleNested {
    b: Int;
    inner2: InnerMostNested;
}

struct InnerMostNested {
    c: Int;
}

contract MaxDepthTest {
    f: DeeplyNested;

    init() {
        self.f = DeeplyNested {
            a: 1,
            inner: MiddleNested {
                b: 2,
                inner2: InnerMostNested {
                    c: 3
                }
            }
        };
    }
}
