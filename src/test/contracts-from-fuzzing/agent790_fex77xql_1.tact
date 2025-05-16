struct DeepInner {
    val: Int;
}

struct Inner {
    a: Int;
    deep: DeepInner;
}

contract TestContract {
    nested: Inner;

    init() {
        self.nested = Inner{a: 1, deep: DeepInner{val: 2}};
    }
}