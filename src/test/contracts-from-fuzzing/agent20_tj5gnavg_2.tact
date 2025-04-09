struct NestedLevel3 {
    deepVal: String;
}

struct NestedLevel2 {
    optionalDeep: NestedLevel3?;
}

struct NestedLevel1 {
    nested: NestedLevel2;
}

contract DeepNestedTest {
    deepStorage: NestedLevel1;

    init() {
        self.deepStorage = NestedLevel1{
            nested: NestedLevel2{
                optionalDeep: NestedLevel3{ deepVal: "deep" }
            }
        };
    }
}