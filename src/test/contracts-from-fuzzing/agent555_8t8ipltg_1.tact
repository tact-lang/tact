struct NestedLevel3 {
    deepValue: String;
}

struct NestedLevel2 {
    maybeDeep: NestedLevel3?;
}

struct NestedLevel1 {
    nested: NestedLevel2;
}

contract DeepNestTest {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            nested: NestedLevel2{
                maybeDeep: NestedLevel3{ deepValue: "hello" }
            }
        };
    }
}