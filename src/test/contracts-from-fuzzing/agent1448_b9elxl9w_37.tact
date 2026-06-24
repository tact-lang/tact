struct SerInt {
    a: Int as uint8;
    b: Int as int16;
    c: Int as int257;
}

contract SerialInt {
    val: SerInt;

    init() {
        self.val = SerInt{ a: 1, b: -2, c: 3 };
    }
}