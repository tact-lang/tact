struct Packed {
    i4: Int as uint4;
    i8: Int as uint8;
    i12: Int as uint12;
    i20: Int as uint20;
    i32: Int as uint32;
}

contract Test18 {
    pack: Packed;

    init() {
        self.pack = Packed{
            i4: 1,
            i8: 2,
            i12: 3,
            i20: 4,
            i32: 5,
        };
    }

    receive() {}
}