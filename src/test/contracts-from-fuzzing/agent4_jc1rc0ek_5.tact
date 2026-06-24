struct Level3 {
    v: Int?;
}

struct Level2 {
    inner: Level3;
}

struct Level1 {
    inner: Level2;
}

contract TestDeepOptional {
    receive() {
        let d = Level1{
            inner: Level2{
                inner: Level3{
                    v: 999
                }
            }
        };
        d.inner.inner.v;
    }
}
