struct Level3 {
    num: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract TestDeepChain {
    receive() {
        let a: Level1 = Level1{ l2: Level2{ l3: Level3{ num: 999 } } };
        a.l2.l3.num;
    }
}
