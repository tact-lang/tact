struct DeepLevel3 {
    value: Int;
}

struct DeepLevel2 {
    item: DeepLevel3;
}

struct DeepLevel1 {
    nested: DeepLevel2;
}

contract DeepNestedContract {
    data: DeepLevel1;

    init() {
        self.data = DeepLevel1{
            nested: DeepLevel2{
                item: DeepLevel3{
                    value: 42,
                },
            },
        };
    }
}