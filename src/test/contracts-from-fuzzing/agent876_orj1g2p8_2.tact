struct InnerMost {
    flag: Bool;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    middle: Middle;
}

contract DeepNestedStruct {
    storage: Outer;

    init() {
        self.storage = Outer{ middle: Middle{ inner: InnerMost{ flag: false } } };
    }
}