struct Level3 {
    x: Int;
    y: Bool;
}

struct Level2 {
    s3a: Level3;
    s3b: Level3;
}

struct Level1 {
    s2: Level2;
}

contract MultiBranch {
    s: Level1;
    init() {
        self.s = Level1{
            s2: Level2{
                s3a: Level3{ x: 1, y: true },
                s3b: Level3{ x: 2, y: false }
            }
        };
    }
}