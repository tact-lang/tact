struct Inner {
    x: Int as uint32;
    y: Int as int8;
    flag: Bool;
}

contract TestContract {
    inner: Inner;

    init() {
        self.inner = Inner{
            x: 100,
            y: -3,
            flag: true
        };
    }
}
