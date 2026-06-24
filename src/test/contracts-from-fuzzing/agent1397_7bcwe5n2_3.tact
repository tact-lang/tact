struct Inner {
    flag: Bool;
    value: Int?;
}

struct Outer {
    inner: Inner;
    num: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                flag: true,
                value: null,
            },
            num: 42,
        };
    }

    receive() {
        let _ = self.data.inner.flag;
        let _ = self.data.inner.value;
        let _ = self.data.num;
    }
}