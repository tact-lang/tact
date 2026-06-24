struct NestedStructWithDefaults {
    a: Int = 1;
    nested: InnerWithDefault;
}

struct InnerWithDefault {
    b: Int = 2;
}

contract NestedDefaultTest {
    data: NestedStructWithDefaults;

    init() {
        self.data = NestedStructWithDefaults{ nested: InnerWithDefault{} };
    }
}