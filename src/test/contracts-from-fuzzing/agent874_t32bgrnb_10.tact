struct Inner {
    val: Int;
}

struct Outer {
    nested: Inner?;
}

contract NestedOptionalTest {
    data: Outer;

    init() {
        self.data = Outer{
            nested: Inner{val: 42}
        };
    }
}
