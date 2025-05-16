struct Level3 {
    f: Int as uint32;
}

struct Level2 {
    c: Level3;
}

struct Level1 {
    b: Level2;
}

contract Test {
    receive() {
        let s: Level1 = Level1{
            b: Level2{
                c: Level3{
                    f: 42
                }
            }
        };
    }
}
