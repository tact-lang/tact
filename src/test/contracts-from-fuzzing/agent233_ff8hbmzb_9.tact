struct SerStruct {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Int as int32;
    e: Int as uint64;
    f: Int as int128;
    g: Int as uint256;
    h: Int; // default int257
}

contract StructWithSerializedInts {
    data: SerStruct;

    init() {
        self.data = SerStruct{
            a: 5,
            b: -5,
            c: 65535,
            d: -123456,
            e: 123456789,
            f: -123456789000,
            g: 123456789123456789123456789,
            h: -1
        };
    }

    receive() {
        let _ = self.data.e;
    }
}