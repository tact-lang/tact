struct InnerMost {
    flag: Bool?;
}

struct Inner {
    nested: InnerMost?;
}

struct Middle {
    nested: Inner?;
}

struct Outer {
    nested: Middle?;
}

contract DeepNestedOptionalTest {
    data: Outer?;
    init() {
        self.data = null;
    }
}