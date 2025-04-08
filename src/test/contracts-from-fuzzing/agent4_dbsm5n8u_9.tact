struct Compact {
    f1: Int as uint8;
    f2: Int as uint16;
    f3: Int as int4;
    f4: Int as int64;
}

contract TestContract {
    c: Compact;

    init() {
        self.c = Compact{ f1: 255, f2: 65535, f3: -8, f4: 123456789 };
    }
}