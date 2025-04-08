struct SerWithRename {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
}

contract SerializedStructDefaults {
    s: SerWithRename;

    init() {
        self.s = SerWithRename{ a: 250, b: -200, c: ton("2") };
    }
}