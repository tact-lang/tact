struct Weird {
    a: Int as uint4 = 4;
    b: Int as int8 = -8;
    c: Int as uint64 = 64;
    d: Int? as int8 = null;
    e: Int? as uint4 = null;
}

contract TestContract {
    nums: Weird = Weird{};

    init() {}
}