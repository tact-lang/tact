struct BitsStruct {
    x: Int as uint8 = 12;
    y: Int as int16 = -32000;
    z: Int as uint1 = 1;
}

contract TestContract {
    bits: BitsStruct = BitsStruct{};

    init() {}
}