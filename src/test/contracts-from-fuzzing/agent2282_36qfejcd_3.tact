struct DeepNested {
    a: Level1;
}

struct Level1 {
    b: Level2;
}

struct Level2 {
    c: Level3;
}

struct Level3 {
    d: Int;
}

contract Test3 {
    s: DeepNested;

    init() {
        self.s = DeepNested{
            a: Level1{
                b: Level2{
                    c: Level3{ d: 99 }
                }
            }
        };
    }
}