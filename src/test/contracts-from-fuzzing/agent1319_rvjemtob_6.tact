struct DeepNest3 {
    d: Int;
}

struct DeepNest2 {
    c: DeepNest3;
}

struct DeepNest1 {
    b: DeepNest2;
}

struct RootNest {
    a: DeepNest1;
}

contract DeepNestedTest {
    root: RootNest;

    init() {
        self.root = RootNest {
            a: DeepNest1 {
                b: DeepNest2 {
                    c: DeepNest3 {
                        d: 123
                    }
                }
            }
        };
    }
}