struct Level3 {
    x: Int;
    a: Int;
    b: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract DeepNestTest {
    receive(msg: Slice) {
        let l3 = Level3 { x: 123, a: 1, b: 2 };
        let l2 = Level2 { l3: l3 };
        let nested = Level1 { l2: l2 };
        if (nested.l2.l3.x == 123) {
            return;
        } else {
            throw(1001);
        }
    }
}
