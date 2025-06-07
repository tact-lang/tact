struct Level3 {
    f1: Int;
    f2: Bool;
}

struct Level2 {
    x: Level3;
    y: Int;
}

struct Level1 {
    a: Int;
    b: Level2;
}

contract MixNested {
    val: Level1;

    init() {
        self.val = Level1{
            a: 1,
            b: Level2{
                x: Level3{ f1: 5, f2: false },
                y: 100
            }
        };
    }
}