contract DefaultedInts {
    a: Int = 1;
    b: Int as int128 = -2;
    c: Int as int64 = 3;
    d: Int as int16 = -4;
    e: Int as int1 = 1;
    f: Int as uint256 = 123;
    g: Int as uint128 = 456;
    h: Int as uint64 = 789;
    i: Int as uint16 = 10;
    j: Int as uint1 = 1;
}