struct Inner {
    x: Int;
    y: Int?;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: 1,
                y: null,
            },
            flag: true,
        };
    }
}