struct ZeroNested {
    val: Int;
}

struct OneNested {
    inner: ZeroNested;
    val: Int;
}

struct TwoNested {
    inner: OneNested;
    val: Int;
}

struct ThreeNested {
    inner: TwoNested;
    val: Int;
}

contract DeepChain {
    f: ThreeNested = ThreeNested{
        inner: TwoNested{
            inner: OneNested{
                inner: ZeroNested{val: 1},
                val: 2
            },
            val: 3
        },
        val: 4
    };
    receive() {
        let _ = self.f.inner.inner.inner.val;
    }
}