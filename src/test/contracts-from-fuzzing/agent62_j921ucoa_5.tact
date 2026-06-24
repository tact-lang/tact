struct Level3 {
    x: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract TestDeepChain {
    receive() {
        let obj = Level1 { l2: Level2 { l3: Level3 { x: 999 } } };
        obj.l2.l3.x;
    }
}
