struct SerialMixed {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
}

contract SerialMixedContract {
    val: SerialMixed = SerialMixed{ a:-8, b:65535, c:-123456, d:99999999 };

    init() {
        self.val = SerialMixed{ a:8, b:1234, c:-654321, d:88888888 };
    }
}