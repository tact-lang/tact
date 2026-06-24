struct Short {
    a: Int as uint8;
    b: Int as int4;
}

contract SerializedStruct {
    s: Short;

    init() {
        self.s = Short{ a: 255, b: -4 };
    }
}