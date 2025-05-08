struct S1 { a: Int as uint8; b: Int as int16; }
struct S2 { s1: S1; c: Int as coins; }

contract SerializedNested(
    data: S2
) {}