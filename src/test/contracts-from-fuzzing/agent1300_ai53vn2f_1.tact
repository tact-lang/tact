struct NestedOptional {
    innerField: Int?;
}

struct DeeplyNestedStruct {
    nested1: NestedOptional;
    nested2: NestedOptional;
    nested3: NestedOptional;
}

contract ComplexStorage {
    deepField: DeeplyNestedStruct;

    init() {
        self.deepField = DeeplyNestedStruct{
            nested1: NestedOptional{ innerField: null },
            nested2: NestedOptional{ innerField: 123 },
            nested3: NestedOptional{ innerField: -456 },
        };
    }
}