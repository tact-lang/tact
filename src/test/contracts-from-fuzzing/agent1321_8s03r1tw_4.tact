struct Level2 {
    xx: Int;
    yy: Int?;
}

struct Level1 {
    foo: Int?;
    bar: Level2;
}

contract MixedNest {
    obj: Level1;
    init() {
        self.obj = Level1{ foo: null, bar: Level2{ xx: 11, yy: null } };
    }
}