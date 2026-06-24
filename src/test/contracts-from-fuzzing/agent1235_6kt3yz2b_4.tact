struct NestedLevel3 {
    lv1: Int;
    optStr: String?;
}

struct NestedLevel2 {
    nested3: NestedLevel3;
    boolVal: Bool;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
    x: Int?;
}

contract DeepPersistent {
    deepState: NestedLevel1;

    init() {
        self.deepState = NestedLevel1{
            nested2: NestedLevel2{
                nested3: NestedLevel3{
                    lv1: 1,
                    optStr: null,
                },
                boolVal: false,
            },
            x: null,
        };
    }
}
