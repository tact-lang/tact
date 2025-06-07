struct PackedStruct {
    a: Int as uint4;
    b: Int as uint8;
    c: Int as int16;
    d: Int as int64;
}

contract PackedFields {
    data: PackedStruct;

    init() {
        self.data = PackedStruct{
            a: 1,
            b: 2,
            c: 3,
            d: 4
        };
    }
}