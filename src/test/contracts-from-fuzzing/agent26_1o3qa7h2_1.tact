struct NestedLevel3 {
    field1: Int;
    field2: Bool?;
}

struct NestedLevel2 {
    inner: NestedLevel3;
}

struct NestedLevel1 {
    wrap: NestedLevel2;
}

contract DeepNestedStorage {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            wrap: NestedLevel2{
                inner: NestedLevel3{
                    field1: 7,
                    field2: true,
                }
            }
        };
    }
}
