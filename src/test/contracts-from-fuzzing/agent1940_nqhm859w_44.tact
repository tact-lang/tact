struct Inner {
    x: Int as uint8;
}

contract MaxUint8 {
    data: Inner;

    init() {
        self.data = Inner{ x:256 };
    }
}