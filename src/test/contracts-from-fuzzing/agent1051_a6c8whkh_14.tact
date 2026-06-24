struct LevelA {
    x: Int;
}

struct LevelB {
    a: LevelA;
}

struct LevelC {
    b: LevelB;
}

contract TestContract {
    nested: LevelC;
    init() {
        self.nested = LevelC{
            b: LevelB{
                a: LevelA{x: 55}
            }
        };
    }
}