struct Level1 {
    l2: Level2;
}

struct Level2 {
    l3: Level3?;
}

struct Level3 {
    l4: Level4?;
}

struct Level4 {
    val: Int;
    flg: Bool?;
}

contract TestContract {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{
                    l4: Level4{
                        val: 999,
                        flg: false
                    }
                }
            }
        };
    }
}
