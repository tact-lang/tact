struct DeepNestedLevel3 {
    val: Int;
}

struct DeepNestedLevel2 {
    nested3: DeepNestedLevel3;
}

struct DeepNestedLevel1 {
    nested2: DeepNestedLevel2;
}

contract DeeplyNestedStructs {
    nested1: DeepNestedLevel1;

    init() {
        self.nested1 = DeepNestedLevel1{ nested2: DeepNestedLevel2{ nested3: DeepNestedLevel3{ val: 42 } } };
    }
}