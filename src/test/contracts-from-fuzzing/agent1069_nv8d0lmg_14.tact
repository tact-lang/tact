struct SSer {
    val: Int as uint8;
    val2: Int as int64;
}

contract SerialFormats {
    s: SSer;

    init() {
        self.s = SSer{val: 5, val2: 42};
    }
}