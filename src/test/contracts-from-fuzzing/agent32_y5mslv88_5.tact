struct Level5 {
    value: Int;
}

struct Level4 {
    value: Int;
    inner: Level5;
}

struct Level3 {
    value: Int;
    inner: Level4;
}

struct Level2 {
    value: Int;
    inner: Level3;
}

struct Level1 {
    value: Int;
    inner: Level2;
}

contract TestDeepChain {
    receive() {
        // Instantiate a deeply nested chain: Level1 -> Level2 -> Level3 -> Level4 -> Level5
        let chain = Level1{
            value: 1,
            inner: Level2{
                value: 2,
                inner: Level3{
                    value: 3,
                    inner: Level4{
                        value: 4,
                        inner: Level5{
                            value: 5
                        }
                    }
                }
            }
        };
        // Sum all values: 1+2+3+4+5 = 15
        dump(chain.value + chain.inner.value + chain.inner.inner.value + chain.inner.inner.inner.value + chain.inner.inner.inner.inner.value);
    }
}
