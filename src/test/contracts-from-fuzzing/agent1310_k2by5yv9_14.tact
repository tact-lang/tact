struct LongStruct {
    i1: Int;
    i2: Int as uint16;
    i3: Int as uint64;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    o1: Int?;
    o2: Bool?;
    s3: String?;
}

contract TestContract(
    big: LongStruct
) {}
