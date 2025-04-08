struct Inner {
    a: Int = 1;
    b: Bool?;
}

struct Middle {
    inner: Inner;
    flag: Bool = true;
}

contract OptionalDefault {
    data: Middle;

    init() {
        self.data = Middle{
            inner: Inner{
                b: null,
            },
        };
    }

    receive() {
        let x = self.data.inner.a;
        self.data = self.data;
    }
}