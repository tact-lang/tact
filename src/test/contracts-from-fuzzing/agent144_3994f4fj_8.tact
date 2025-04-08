struct Inner {
    v: Int;
}

contract OptNestedInner {
    innerOpt: Inner?;
    init() {
        self.innerOpt = Inner{ v: 55 };
    }
}
