struct Level3 {
    z: Int;
}

struct Level2 {
    inner3: Level3;
}

struct Level1 {
    inner2: Level2;
}

contract DeeplyNestedStruct {
    deep: Level1;

    init() {
        self.deep = Level1{
            inner2: Level2{
                inner3: Level3{
                    z: 42
                }
            }
        };
    }
}