struct Inner {
    a: Int;
}

struct Wrapper1 {
    inner: Inner;
}

struct Wrapper2 {
    inner: Wrapper1;
}

struct Wrapper3 {
    inner: Wrapper2;
}

contract DeepWrapContract {
    wrap: Wrapper3;

    init() {
        self.wrap = Wrapper3{
            inner: Wrapper2{
                inner: Wrapper1{
                    inner: Inner{ a: 55 },
                },
            },
        };
    }
}