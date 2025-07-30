struct OptNested {
    inner: Inner?;
}

struct Inner {
    val: Int;
    flag: Bool;
}

contract OptNestedTest {
    data: OptNested;

    init() {
        self.data = OptNested{ inner: null };
    }
}
