struct Inner {
    foo: Int;
}

struct Outer {
    bar: Inner?;
}

contract OptNestedNullTest {
    val: Outer;

    init() {
        self.val = Outer{};
    }
}
