struct DeepIn {
    val: Int;
}

struct MidIn {
    inner: DeepIn;
}

struct OuterWrap {
    m1: MidIn;
    m2: MidIn;
    m3: MidIn;
}

contract InitUnassignedTest {
    storage: OuterWrap;

    init() {
        self.storage = OuterWrap{
            m1: MidIn{inner: DeepIn{val: 1}},
            m2: MidIn{inner: DeepIn{val: 2}},
            m3: MidIn{inner: DeepIn{val: 3}}
        };
    }

    receive() {
        let _ = self.storage.m2.inner.val + 1;
    }
}