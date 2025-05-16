struct InnerMost {
    value: Int;
}

struct Inner {
    innerMost: InnerMost;
    flag: Bool;
}

struct Outer {
    inner: Inner;
    txt: String;
}

contract HugeNestedCombo {
    data: Outer = Outer{inner: Inner{innerMost: InnerMost{value: 5}, flag: true}, txt: "test"};

    init() {
        self.data = Outer{inner: Inner{innerMost: InnerMost{value: 42}, flag: false}, txt: "changed"};
    }
}