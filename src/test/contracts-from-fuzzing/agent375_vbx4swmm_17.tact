struct Inner {
    x: Int as int64;
    y: Int as uint32;
    amount: Int as coins;
    rem: Slice as remaining;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                x: -42,
                y: 123,
                amount: 1000000,
                rem: emptyCell().asSlice(),
            },
            flag: true,
        };
    }

    receive() {
        let _ = self.data;
    }
}