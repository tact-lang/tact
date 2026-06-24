struct DeeplyNested1 {
    value: Int?;
}

struct DeeplyNested2 {
    nested: DeeplyNested1;
    flag: Bool;
}

struct DeeplyNested3 {
    level2: DeeplyNested2;
    note: String;
}

contract DeepStructStorage {
    item: DeeplyNested3;

    init() {
        self.item = DeeplyNested3{
            level2: DeeplyNested2{
                nested: DeeplyNested1{value: null},
                flag: false
            },
            note: "test"
        };
    }
}