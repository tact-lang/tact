struct Sizer {
    a: Int as uint8;
    b: Int as uint32;
    c: Int as int64;
}

contract SerializedStruct {
    store: Sizer;

    init() {
        self.store = Sizer{ a:5, b:12345, c:-999999 };
    }
}