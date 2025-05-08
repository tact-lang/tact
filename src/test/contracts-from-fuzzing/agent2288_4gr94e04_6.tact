struct Level3 {
    value: Int;
}

struct Level2 {
    nested: Level3;
}

struct Level1 {
    nested: Level2;
}

contract TestContract {
    l1: Level1;

    init() {
        self.l1 = Level1{
            nested: Level2{
                nested: Level3{ value: 123 }
            }
        };
    }
}