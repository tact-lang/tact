struct MultiLevel {
    a: Int;
    b: LevelTwo;
}

struct LevelTwo {
    c: Bool;
    d: LevelThree;
}

struct LevelThree {
    e: Int;
}

contract MultiLayers {
    m: MultiLevel;

    init() {
        self.m = MultiLevel{
            a: 1,
            b: LevelTwo {
                c: true,
                d: LevelThree { e: 5 }
            }
        };
    }
}