struct NestedLevel3 {
    val: Int;
}

struct NestedLevel2 {
    level3: NestedLevel3;
}

struct NestedLevel1 {
    optionalLev2: NestedLevel2?;
}

contract DeepNestedTest {
    nestedField: NestedLevel1;

    init() {
        self.nestedField = NestedLevel1{ optionalLev2: null };
    }
}
