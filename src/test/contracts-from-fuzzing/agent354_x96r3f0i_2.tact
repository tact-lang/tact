struct NestedLevelTwo { a: Int; b: Int; }
struct NestedLevelOne { inner: NestedLevelTwo; }

contract DeepNestedStructField {
    nested: NestedLevelOne;

    init() {
        self.nested = NestedLevelOne{ inner: NestedLevelTwo{ a: 10, b: 20 } };
    }
}
