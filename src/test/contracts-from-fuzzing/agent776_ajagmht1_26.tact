struct MultiLevel {
    a: LevelOne;
    b: Int;
}

struct LevelOne {
    x: Int;
    y: LevelTwo;
}

struct LevelTwo {
    z: Bool;
}

contract MultiNest {
    m: MultiLevel;
    init() {
        self.m = MultiLevel{
            a: LevelOne{
                x: 1,
                y: LevelTwo{ z: false }
            },
            b: 99
        };
    }
}