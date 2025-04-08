struct Inner {
    field: Int;
}

struct Outer {
    inner: Inner;
    optInner: Inner?;
}

contract C {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{field: 1},
            optInner: null,
        };
    }

    receive() {
        let _ = self.data;
    }
}