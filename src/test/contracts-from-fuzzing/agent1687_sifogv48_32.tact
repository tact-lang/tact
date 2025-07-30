contract Test {
    foo: Int as uint32;
    bar: Int as int64;
    optstr: String?;
    bl: Bool;

    init() {
        self.foo = 4294967295; // max uint32
        self.bar = -9223372036854775808; // min int64
        self.optstr = null;
        self.bl = true;
    }
}