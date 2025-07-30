contract LongFields {
    a: Int = 1;
    b: Int as uint8 = 2;
    c: Int as int16 = 3;
    d: Int as uint30 = 4;
    e: Int as uint64 = 5;
    f: Int as int256 = 6;
    g: Int as uint4 = 7;
    h: Bool = true;
    i: Bool = false;
    j: Int as int2 = -1;
    k: Int as uint1 = 1;
    l: Int as int32 = -1000;
    m: Int as int128 = 1234567;
    n: Int as uint7 = 99;
    o: Int as int3 = 3;

    receive() {}
}