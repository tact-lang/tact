struct Level3 {
    val: Int;
}

struct Level2 {
    m: map<Int, Level3>;
}

struct Level1 {
    l2: Level2;
}

fun testDeepNestedMap(): Int {
    let lev3 = Level3 { val: 10 };
    let m: map<Int, Level3> = emptyMap();
    m.set(2, lev3);
    let lev2 = Level2 { m: m };
    let lev1 = Level1 { l2: lev2 };
    return lev1.l2.m.get(2)!!.val + 5;
}

contract TestDeepNestedMap {
    receive() {
        testDeepNestedMap();
    }
}
