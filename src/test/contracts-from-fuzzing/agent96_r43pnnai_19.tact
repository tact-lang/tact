struct Inner {
    val: Int as uint8;
}

contract SerializedContract {
    s: Inner;

    init() {
        self.s = Inner{ val: 255 };
    }
}