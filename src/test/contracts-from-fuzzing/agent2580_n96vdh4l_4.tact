struct Level3 {
    d: Int;
    e: Bool;
}

struct Level2 {
    b: Int;
    c: Level3;
}

struct Level1 {
    a: Level2;
}

contract ThreeDeep {
    x: Level1;

    init() {
        self.x = Level1{
            a: Level2{
                b: 1,
                c: Level3{
                    d: 2,
                    e: true
                }
            }
        };
    }
}