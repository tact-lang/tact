struct Level3 {
    c: Bool;
}

struct Level2 {
    b: Level3;
}

struct Level1 {
    a: Level2;
}

contract NestedDefault {
    data: Level1;
    init() {
        self.data = Level1{
            a: Level2{
                b: Level3{
                    c: true
                }
            }
        };
    }
}