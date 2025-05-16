struct LevelB {
    flag: Bool;
    nestedC: LevelC;
}

struct LevelC {
    number: Int;
}

struct LevelA {
    nestedB: LevelB;
}

contract CrossNested {
    root: LevelA;

    init() {
        self.root = LevelA{
            nestedB: LevelB{
                flag: true,
                nestedC: LevelC{ number: 7 }
            }
        };
    }
}