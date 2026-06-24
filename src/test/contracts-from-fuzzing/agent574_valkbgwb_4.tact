struct Level3 {
    val: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepChain {
    root: Level1;

    init() {
        self.root = Level1{
            l2: Level2{
                l3: Level3{ val: 123 },
            },
        };
    }

    receive() {
        dump(self.root.l2.l3.val);
    }
}