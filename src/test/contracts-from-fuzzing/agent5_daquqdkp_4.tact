struct Level4 {
    X: Int;
}

struct Level3 {
    L4: Level4;
}

struct Level2 {
    L3: Level3;
}

struct Level1 {
    L2: Level2;
    Y: Int;
}

contract TestDeepChain {
    receive() {
        let l4: Level4 = Level4 { X: 42 };
        let l3: Level3 = Level3 { L4: l4 };
        let l2: Level2 = Level2 { L3: l3 };
        let l1: Level1 = Level1 { L2: l2, Y: 100 };
        let _ = l1.L2.L3.L4.X + l1.Y;
    }
}
