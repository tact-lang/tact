struct LevelOne {
    x: Int;
}

struct LevelTwo {
    one: LevelOne;
    y: Int;
}

struct LevelThree {
    two: LevelTwo;
    z: Int;
}

struct LevelFour {
    three: LevelThree;
    w: Int;
}

contract QuadNested {
    data: LevelFour;

    init() {
        self.data = LevelFour{
            three: LevelThree{
                two: LevelTwo{
                    one: LevelOne{x:1},
                    y:2
                },
                z:3
            },
            w:4
        };
    }
}