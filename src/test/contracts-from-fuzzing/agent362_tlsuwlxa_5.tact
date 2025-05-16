struct Level3 {
    x: Int;
    y: Bool?;
}

struct Level2 {
    z: Level3;
    t: Int?;
}

struct Level1 {
    mid: Level2;
    f: Bool;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            mid: Level2{ z: Level3{ x: 1, y: null }, t: 5 },
            f: true
        };
    }

    receive() {
        self.nested = Level1{
            mid: Level2{ z: Level3{ x: 2, y: false }, t: null },
            f: false
        };
    }
}