struct Level3 {
    d: Int;
}

struct Level2 {
    c: Level3;
}

struct Level1 {
    b: Level2;
}

contract DeepNestedStruct {
    state: Level1;

    init() {
        self.state = Level1{
            b: Level2{
                c: Level3{
                    d: 123
                }
            }
        };
    }
}