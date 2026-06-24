struct InnerMost {
    flag: Bool;
}

struct Middle {
    nested: InnerMost;
}

struct Outer {
    deep: Middle;
}

contract DeepNestedTest {
    s: Outer;

    init() {
        self.s = Outer {
            deep: Middle {
                nested: InnerMost {
                    flag: true
                }
            }
        };
    }
}
