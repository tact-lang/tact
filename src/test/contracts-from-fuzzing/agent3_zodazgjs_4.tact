struct Level5 { v: Int; }

struct Level4 { inner: Level5; }

struct Level3 { inner: Level4; }

struct Level2 { inner: Level3; }

struct Level1 { inner: Level2; }

contract TestDeepNested {
    receive() {
        let chain = Level1 {
            inner: Level2 {
                inner: Level3 {
                    inner: Level4 {
                        inner: Level5 { v: 999 }
                    }
                }
            }
        };
        chain.inner.inner.inner.inner.v;
    }
}
