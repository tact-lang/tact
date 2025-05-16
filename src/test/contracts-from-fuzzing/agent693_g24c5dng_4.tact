struct ManyFields {
    i8: Int as int8;
    u8: Int as uint8;
    i16: Int as int16;
    u16: Int as uint16;
    i32o: Int? as int32;
    u64o: Int? as uint64;
    b1: Bool;
    b2: Bool;
    s: String;
    addr: Address;
    dat: Cell;
    slice: Slice;
}

contract TestManyFields {
    state: ManyFields;

    init() {
        self.state = ManyFields{
            i8:1, u8:2, i16:3, u16:4, i32o:null, u64o:null,
            b1:true, b2:false, s:"hi", addr:myAddress(),
            dat:emptyCell(), slice:emptyCell().asSlice()
        };
    }
}