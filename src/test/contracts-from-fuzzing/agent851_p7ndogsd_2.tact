struct Level3 {
    val3: Int;
}

struct Level2 {
    val2: Int;
    lvl3: Level3;
}

struct Level1 {
    val1: Int;
    lvl2: Level2;
}

contract MultiNestedTest {
    deep: Level1;

    init() {
        self.deep = Level1{
            val1: 1,
            lvl2: Level2{
                val2: 2,
                lvl3: Level3{
                    val3: 3
                }
            }
        };
    }
}