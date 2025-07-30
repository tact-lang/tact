struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Inner {
    one: InnerMost;
    two: Int?;
    three: String;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner: Inner{
                one: InnerMost{
                    a: 5,
                    b: null,
                },
                two: null,
                three: "ok",
            },
            flag: true,
        };
    }

    receive() {
        let _ = self.storage.inner.one.a;
    }
}