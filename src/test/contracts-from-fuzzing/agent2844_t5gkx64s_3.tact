struct Level3 {
    c: Bool;
}

struct Level2 {
    b: Level3;
}

struct Level1 {
    a: Level2;
}

contract TestContract {
    nested: Level1;

    init() {
        self.nested = Level1{
            a: Level2{
                b: Level3{
                    c: true
                }
            }
        };
    }
}
