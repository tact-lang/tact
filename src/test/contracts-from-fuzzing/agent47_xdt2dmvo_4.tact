struct Inner {
    val: Int;
    opt: Int?;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    receive() {
        let s: Outer = Outer{
            inner: Inner{
                val: 42,
                opt: 999
            }
        };
        s.inner.opt;
    }
}
