struct Level3 {
    deepVal: Int;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    middle: Level2;
}

contract DeeplyNestedStruct {
    root: Level1;

    init() {
        self.root = Level1{
            middle: Level2{
                inner: Level3{
                    deepVal: 99,
                },
            },
        };
    }
}