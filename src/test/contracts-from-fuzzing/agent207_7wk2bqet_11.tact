struct Level1 {
    a: Int;
}

struct Level2 {
    b: Int;
    l1: Level1;
}

struct Level3 {
    c: Int;
    l2: Level2;
}

contract Test11 {
    complex: Level3;
    init() {
        self.complex = Level3{
            c: 3,
            l2: Level2{
                b: 2,
                l1: Level1{
                    a: 1
                }
            }
        };
    }
}