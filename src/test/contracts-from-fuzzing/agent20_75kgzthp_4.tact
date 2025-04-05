struct Level5 {
    val: Int
}

struct Level4 {
    inner: Level5
}

struct Level3 {
    inner: Level4
}

struct Level2 {
    inner: Level3
}

struct Level1 {
    inner: Level2
}

contract TestDeepNested {
    receive() {
        let s = Level1 {
            inner: Level2 {
                inner: Level3 {
                    inner: Level4 {
                        inner: Level5 { val: 99 }
                    }
                }
            }
        };
    }
}
