struct LevelOne {
    x: Int as int8;
    y: Bool;
}

struct LevelTwo {
    a: LevelOne;
    b: Int as uint9;
}

struct LevelThree {
    c: LevelTwo;
    d: Int as int5;
}

contract MixedSerNest {
    n: LevelThree;

    init() {
        self.n = LevelThree{
            c: LevelTwo{
                a: LevelOne{ x:-5, y:true },
                b: 200
            },
            d: -7
        };
    }
}