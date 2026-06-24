struct Nest {
    lvl1: Level1;
}

struct Level1 {
    lvl2: Level2?;
}

struct Level2 {
    val: Int;
}

contract Test {
    nest: Nest;

    init() {
        self.nest = Nest{
            lvl1: Level1{
                lvl2: Level2{
                    val: 123
                }
            }
        };
    }
}
