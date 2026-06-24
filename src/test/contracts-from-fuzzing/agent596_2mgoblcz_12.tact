struct NestedOptional {
    sub: Inner?;
}

struct Inner {
    value: Int;
}

contract NestedOptFieldTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ sub: null };
    }
}