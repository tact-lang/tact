struct Level2 {
    n: Int;
    flag: Bool;
}

struct Level1 {
    lvl2: Level2?;
}

contract Test {
    lvl1: Level1;

    init() {
        self.lvl1 = Level1{
            lvl2: Level2{
                n: 100,
                flag: true
            }
        };
    }
}