struct TailPadding {
    a: Int as uint32;
    b: Int as int4;
    c: Int as uint1;
    d: Bool;
}

contract CompactStorage(
    s: TailPadding
) {}