struct NestedOptionals {
    s1: Inner?;
}

struct Inner {
    s2: InnerMost?;
}

struct InnerMost {
    flag: Bool;
}

contract OptionalNestTest {
    storage: NestedOptionals;

    init() {
        self.storage = NestedOptionals {
            s1: Inner {
                s2: InnerMost {
                    flag: false
                }
            }
        };
    }
}