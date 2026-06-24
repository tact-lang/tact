struct NestedLevel3 {
    deepVal: Int;
}

struct NestedLevel2 {
    nested3: NestedLevel3;
}

struct NestedLevel1 {
    nested2: NestedLevel2;
}

contract DeepNestedContract {
    data: NestedLevel1;

    init() {
        self.data = NestedLevel1{
            nested2: NestedLevel2{
                nested3: NestedLevel3{
                    deepVal: 42,
                },
            },
        };
    }
}