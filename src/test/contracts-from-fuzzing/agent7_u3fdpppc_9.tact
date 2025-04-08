struct Sized {
    a: Int as int4;
    b: Int as uint8;
}

contract WithSizedStruct {
    s: Sized;

    init() {
        self.s = Sized { a: -7, b: 254 };
    }
}