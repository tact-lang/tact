struct Level4 {
    V: Int;
}

struct Level3 {
    L4: Level4;
}

struct Level2 {
    L3: Level3;
    opt: Int?;
}

struct Level1 {
    L2: Level2;
    A: Int;
}

contract TestDeepChain {
    receive() {
        let lvl4 = Level4 { V: 100 };
        let lvl3 = Level3 { L4: lvl4 };
        let lvl2 = Level2 { L3: lvl3, opt: 50 };
        let lvl1 = Level1 { L2: lvl2, A: 10 };
        // Sum the values from different levels to ensure deep access:
        dump(lvl1.A + lvl1.L2.opt!! + lvl1.L2.L3.L4.V);
    }
}
