struct NestedWithDefaults {
    a: Int = 1;
    b: SubNested;
}

struct SubNested {
    c: Int = 2;
    d: Int?;
}

contract NestedWithDefaultsTest {
    data: NestedWithDefaults;

    init() {
        self.data = NestedWithDefaults{
            b: SubNested{}
        };
    }
}
