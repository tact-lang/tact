struct DeepNested {
    level1: Int;
    level2: NestedOuter;
}

struct NestedInner {
    boolField: Bool;
    intField: Int;
    stringField: String;
}

struct NestedOuter {
    field1: Int;
    optionalInner: NestedInner?;
    flag: Bool;
}

contract StorageDeepTest {
    deepData: DeepNested;

    init() {
        self.deepData = DeepNested{
            level1: 5,
            level2: NestedOuter{
                field1: 7,
                optionalInner: null,
                flag: false,
            },
        };
    }
}
