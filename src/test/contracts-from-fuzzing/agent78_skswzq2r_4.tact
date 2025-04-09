struct DeepLevel3 {
    x: Int;
    y: Int;
}

struct DeepLevel2 {
    deep3: DeepLevel3;
    flag: Bool;
}

struct DeepLevel1 {
    deep2: DeepLevel2;
    comment: String?;
}

contract DeepNestedPersistent {
    nested: DeepLevel1;

    init() {
        self.nested = DeepLevel1{
            deep2: DeepLevel2{
                deep3: DeepLevel3{ x: 1, y: 2 },
                flag: true
            },
            comment: null
        };
    }
}