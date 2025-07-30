struct CompositeDefaults {
    x: Int = 5;
    y: String = "abc";
    z: Bool = true;
}

struct NestedCompositeDefaults {
    a: CompositeDefaults;
    b: CompositeDefaults;
}

contract NestedDefaultsTest {
    val: NestedCompositeDefaults;

    init() {
        self.val = NestedCompositeDefaults{
            a: CompositeDefaults{},
            b: CompositeDefaults{},
        };
    }
}