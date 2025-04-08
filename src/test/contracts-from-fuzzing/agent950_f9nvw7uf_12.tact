// test nested deep with mixed optionals and optional struct
struct LevelA {
    levelb: LevelB?;
    y: Int;
}

struct LevelB {
    levelc: LevelC;
    flag: Bool?;
}

struct LevelC {
    name: String;
    data: Cell?;
}

contract MixDeep {
    val: LevelA;

    init() {
        self.val = LevelA{
            y: 42,
            levelb: null
        };
    }
}