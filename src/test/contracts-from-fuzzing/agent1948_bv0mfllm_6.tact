struct InnerMost {
    value: Int;
}

struct Inner {
    deep: InnerMost;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract MultiLevelNested {
    outer: Outer;
    init() {
        self.outer = Outer{ middle: Middle{ inner: Inner{ deep: InnerMost{ value: 42 } } } };
    }
}