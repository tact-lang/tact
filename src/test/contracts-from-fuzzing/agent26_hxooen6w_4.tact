struct Level3 {
    F: Int;
}

struct Level2 {
    L3: Level3;
}

struct Level1 {
    L2: Level2;
}

contract Test {
    receive() {
        let s: Level1 = Level1{
            L2: Level2{
                L3: Level3{ F: 42 }
            }
        };
    }
}
