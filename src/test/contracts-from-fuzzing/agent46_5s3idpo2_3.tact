struct DeepNested {
    foo: Int;
}

struct MiddleNested {
    deep: DeepNested;
}

contract DeeplyNestedStruct {
    nested: MiddleNested;

    init() {
        self.nested = MiddleNested{ deep: DeepNested{ foo: 55 } };
    }
}
