struct MixSerde {
    i1: Int as uint8;
    i2: Int as int16;
    i3: Int as uint64;
    i4: Int;
    b1: Bool;
    b2: Bool;
    s: String;
    sl: Slice;
    c: Cell;
    addr: Address;
}

contract MixedSerialization {
    m: MixSerde;

    init() {
        self.m = MixSerde{
            i1:1, i2:2, i3:3, i4:4,
            b1:true, b2:false,
            s:"s", sl:emptyCell().asSlice(), c:emptyCell(), addr:myAddress()
        };
    }
}