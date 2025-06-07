struct Level1 {
    val: Int;
}

struct Level2 {
    l1: Level1?;
}

struct Level3 {
    l2: Level2?;
}

contract TestContract {
    deepOpt: Level3? = null;

    receive() {
        self.deepOpt = Level3{
            l2: Level2{
                l1: Level1{ val: 55 }
            }
        };
    }
}
