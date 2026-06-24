struct NestedOptDefault {
    a: Int? = null;
    b: Inner? = null;
}

struct Inner {
    x: Int = 7;
}

contract OptDefTest {
    val: NestedOptDefault;
    init() {
        self.val = NestedOptDefault{};
    }
}