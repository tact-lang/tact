struct Serial {
    i: Int as int32;
    b: Int as uint8;
}

contract SerialStruct {
    s: Serial;
    init() {
        self.s = Serial{ i: -12, b: 250 };
    }
}