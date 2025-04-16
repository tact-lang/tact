struct LevelB {
    y: Int;
}

struct LevelA {
    x: Int;
    nest: LevelB;
}

contract NestedBasic {
    f: LevelA;

    init() {
        self.f = LevelA{ x:10, nest: LevelB{ y:20 } };
    }
}
