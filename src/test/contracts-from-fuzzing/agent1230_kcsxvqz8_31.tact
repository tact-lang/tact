struct MixWidths {
    a: Int as int4;
    b: Int as uint12;
    c: Int as int33;
}

contract StorageWidths {
    s: MixWidths;

    init() {
        self.s = MixWidths{ a:7, b:2047, c:-100000 };
    }
}