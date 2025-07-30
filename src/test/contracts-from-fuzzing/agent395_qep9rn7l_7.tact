struct Inner {
    x: Int as int64;
    y: Int as uint32;
}

struct Outer {
    inner: Inner;
    amount: Int as coins;
}

contract SerializedNested {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: -1,
                y: 42
            },
            amount: ton("1")
        };
    }
}
