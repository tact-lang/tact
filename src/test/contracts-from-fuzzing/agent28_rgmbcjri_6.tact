struct Level5 {
    Value: Int;
}

struct Level4 {
    L5: Level5;
}

struct Level3 {
    L4: Level4;
}

struct Level2 {
    L3: Level3;
}

struct Level1 {
    L2: Level2;
}

contract TestDeepChain {
    receive() {
        let chain: Level1 = Level1 { L2: Level2 { L3: Level3 { L4: Level4 { L5: Level5 { Value: 999 } } } } };
        dump(chain.L2.L3.L4.L5.Value);
    }
}
