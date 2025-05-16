struct Packed {
    i: Int as uint8;
    j: Int as uint16;
    k: Int as int32;
}

contract MixedSerializedStruct {
    p: Packed;

    init() {
        self.p = Packed{i:5,j:1000,k:-2000};
    }
}