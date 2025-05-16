struct Level3 {
    q: Int;
    r: Int;
}

struct Level2 {
    b: Level3;
}

struct Level1 {
    a: Level2;
}

contract SuperDeep {
    nested: Level1;

    init() {
        self.nested = Level1{
            a: Level2{
                b: Level3{
                    q: 8,
                    r: 9
                }
            }
        };
    }
}
