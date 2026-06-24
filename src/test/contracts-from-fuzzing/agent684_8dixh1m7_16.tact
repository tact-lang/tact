struct DeepInit {
    val: Int;
}

contract AssignDeepNested {
    inner: DeepInit;
    outer: DeepInit;
    init() {
        self.inner = DeepInit { val: 1 };
        self.outer = self.inner;
    }
}