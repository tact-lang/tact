struct Level5 {
    v: Int;
}

struct Level4 {
    l5: Level5;
}

struct Level3 {
    l4: Level4;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

fun testDeep(l: Level1): Int {
    return l.l2.l3.l4.l5.v;
}

contract DeepNestedTest {
    receive() {
        let d = Level1{ l2: Level2{ l3: Level3{ l4: Level4{ l5: Level5{ v: 123 } } } } };
        testDeep(d);
    }
}
