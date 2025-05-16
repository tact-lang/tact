struct MixedInts {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint32;
    d: Int as int64;
    e: Int; // default int257
}

contract TestContract {
    mixed: MixedInts = MixedInts{a:7,b:-5,c:123456,d:-987654321,e:42};
    init() {}
}