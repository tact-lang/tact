struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    inner: Inner;
    flag: Bool;
    num: Int;
}

contract DeepNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                a: 10,
                b: true,
            },
            flag: false,
            num: 42,
        };
    }
}
