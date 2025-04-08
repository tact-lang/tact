struct Level3 {
    v3: Int;
}

struct Level2 {
    v2: Int;
    nest3: Level3;
}

struct Level1 {
    v1: Int;
    nest2: Level2;
}

contract TestContract {
    l1: Level1;

    init() {
        self.l1 = Level1{
            v1: 10,
            nest2: Level2{
                v2: 20,
                nest3: Level3{ v3:30 }
            }
        };
    }
}