struct SerialOpts {
    i1: Int as uint8;
    i2: Int as uint16;
    i3: Int as uint32;
    i4: Int as int64;
}

contract SerialOptsTest {
    dat: SerialOpts;

    init() {
        self.dat = SerialOpts{
            i1: 1,
            i2: 2,
            i3: 3,
            i4: 4,
        };
    }
}