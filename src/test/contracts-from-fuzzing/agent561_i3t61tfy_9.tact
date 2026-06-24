contract SerializeFormats {
    si: Int as int32;
    ui: Int as uint64;
    co: Int as coins;
    bl: Bool;

    init() {
        self.si = 12;
        self.ui = 34;
        self.co = ton("0.2");
        self.bl = true;
    }
}