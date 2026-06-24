struct S1 {
    i: Int as uint8 = 8;
}

struct S2 {
    s1: S1 = S1{};
    j: Int as int16 = -16;
}

struct S3 {
    s2: S2 = S2{};
    k: Int as uint32 = 32;
}

contract DeepSerialWidths {
    val: S3 = S3{};
}