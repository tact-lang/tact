struct Inner {
    flag: Bool;
    count: Int;
}

struct Outer {
    inner: Inner;
    extra: Int;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                flag: true,
                count: 5,
            },
            extra: 10,
        };
    }
}