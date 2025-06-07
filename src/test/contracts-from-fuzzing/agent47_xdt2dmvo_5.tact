struct Level3 {
    x: Int;
}

struct Level2 {
    l3: Level3;
}

struct Level1 {
    l2: Level2;
}

contract TestContract {
    receive() {
        let s: Level1 = Level1 {
            l2: Level2 {
                l3: Level3 { x: 123 }
            }
        };
        s.l2.l3.x;
    }
}
