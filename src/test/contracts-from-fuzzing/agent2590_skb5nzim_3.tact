struct NestedOptional {
    val: Inner?;
}

struct Inner {
    num: Int;
    flag: Bool;
}

contract NestedOptionalTest {
    store: NestedOptional;

    init() {
        self.store = NestedOptional{ val: null };
    }
}