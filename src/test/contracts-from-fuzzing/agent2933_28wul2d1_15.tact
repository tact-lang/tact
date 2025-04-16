struct SerStruct {
    f1: Int as uint8;
    f2: Int as int16;
    f3: Int as uint32;
}

contract SerFormatsInsideStruct {
    s: SerStruct;

    init() {
        self.s = SerStruct{
            f1: 1,
            f2: -50,
            f3: 70000,
        };
    }
}