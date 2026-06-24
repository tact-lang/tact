struct InnerMost {
    deepVal: Bool;
}

struct Inner {
    foo: Int;
    nest: InnerMost;
}

contract DeepNestedStructTest {
    val: Inner;

    init() {
        self.val = Inner { foo: 1, nest: InnerMost { deepVal: false } };
    }
}