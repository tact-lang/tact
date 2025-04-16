struct NestedLevel3 {
    z: Int;
}

struct NestedLevel2 {
    y: NestedLevel3;
}

struct NestedLevel1 {
    x: NestedLevel2;
}

contract DeeplyNestedStructs {
    nestedField: NestedLevel1;

    init() {
        self.nestedField = NestedLevel1{ x: NestedLevel2{ y: NestedLevel3{ z: 123 } } };
    }
}