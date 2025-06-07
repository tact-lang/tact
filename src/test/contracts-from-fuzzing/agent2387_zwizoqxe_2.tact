struct NestedStruct {
    level2: Level2;
}

struct Level2 {
    level3: Level3;
}

struct Level3 {
    optionalDeep: Bool?;
    theInt: Int;
}

contract DeepContract {
    store: NestedStruct;

    init() {
        self.store = NestedStruct{
            level2: Level2{
                level3: Level3{
                    optionalDeep: false,
                    theInt: 42,
                },
            },
        };
    }
}