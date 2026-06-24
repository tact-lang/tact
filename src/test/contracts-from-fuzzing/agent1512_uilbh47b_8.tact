struct Inner {
    foo: Int = 7;
    bar: String?;
}

struct Outer {
    inner: Inner;
    flag: Bool = false;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                foo: 42,
                bar: null
            },
            flag: true
        };
    }
}