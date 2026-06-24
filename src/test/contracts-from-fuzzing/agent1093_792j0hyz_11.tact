struct TwoLevel {
    nested1: Level1;
}

struct Level1 {
    nested2: Level2;
}

struct Level2 {
    a: Int;
    b: Bool;
    c: String;
}

contract DeepNest {
    f: TwoLevel;

    init() {
        self.f = TwoLevel{
            nested1: Level1{
                nested2: Level2{
                    a: 11,
                    b: false,
                    c: "deep"
                }
            }
        };
    }
}