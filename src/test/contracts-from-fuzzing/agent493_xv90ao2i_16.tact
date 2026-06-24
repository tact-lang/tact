struct S1 { x: Int; }

struct Wrapper {
    inner: S1?;
    n: Int;
}

contract OptStructPartial {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            inner: S1{ x: 5 },
            n: 10
        };
    }
}