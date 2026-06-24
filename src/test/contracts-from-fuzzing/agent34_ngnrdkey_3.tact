struct Level1 {
    x: Int;
}

struct Level2 {
    level1: Level1;
    y: Int;
}

struct Level3 {
    level2: Level2;
    z: Int;
}

contract NestedTest {
    receive() {
        let l1 = Level1{x: 10};
        let l2 = Level2{level1: l1, y: 20};
        let l3 = Level3{level2: l2, z: 30};
    }
}
