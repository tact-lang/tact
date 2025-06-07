struct DeepNested {
    a: Level2;
}

struct Level2 {
    b: Level3;
}

struct Level3 {
    c: Level4;
}

struct Level4 {
    d: Int;
}

contract DeepNestTest {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            a: Level2{
                b: Level3{
                    c: Level4{
                        d: 1
                    }
                }
            }
        };
    }
}