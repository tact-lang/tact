struct DeepLevel3 {
    a: Int;
}

struct DeepLevel2 {
    d3: DeepLevel3;
}

struct DeepLevel1 {
    d2: DeepLevel2;
}

contract DeepNestedStorage {
    state: DeepLevel1;

    init() {
        self.state = DeepLevel1{
            d2: DeepLevel2{
                d3: DeepLevel3{
                    a: 42,
                },
            },
        };
    }
}