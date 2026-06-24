struct NestedSerialization {
    foo: Int as uint32;
    bar: Int as int8;
    inner: Inner;
}

struct Inner {
    num: Int as uint64;
    flag: Bool;
}

contract NestedSer {
    s: NestedSerialization;
    init() {
        self.s = NestedSerialization{
            foo: 10,
            bar: -5,
            inner: Inner{
                num: 1000,
                flag: true
            }
        };
    }
    receive() {
        let _ = self.s.foo + self.s.bar + self.s.inner.num;
    }
}