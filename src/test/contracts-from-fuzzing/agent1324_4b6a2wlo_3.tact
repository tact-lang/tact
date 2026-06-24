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
    e: String;
}

contract DeepContract {
    nested: DeepNested;

    init() {
        self.nested = DeepNested{
            a: Level1{
                b: Level2{
                    c: Level3{
                        d: 42,
                        e: "deep"
                    }
                }
            }
        };
    }
}