struct CrazySerial {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint4;
    d: Int as int1;
    e: Bool;
    f: Bool?;
}

contract NestedParamBased(
    data: CrazySerial
) {}