struct Level5 {
    V: Int;
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

fun testDeepChain(): Int {
    let lv5 = Level5 { V: 99 };
    let lv4 = Level4 { L5: lv5 };
    let lv3 = Level3 { L4: lv4 };
    let lv2 = Level2 { L3: lv3 };
    let lv1 = Level1 { L2: lv2 };
    return lv1.L2.L3.L4.L5.V;
}

contract TestDeepChain {
    receive() {
        testDeepChain();
    }
}
