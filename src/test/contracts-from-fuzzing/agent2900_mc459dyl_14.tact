struct Level3 {
    f: Int;
    flag: Bool;
}

struct Level2 {
    l3a: Level3;
    l3b: Level3;
}

struct Level1 {
    l2: Level2;
    val: Int;
}

contract DeepNested {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3a: Level3{ f:1, flag:true },
                l3b: Level3{ f:2, flag:false },
            },
            val: 99,
        };
    }
}
