struct Tight {
    a: Int as uint1 = 1;
    b: Int as uint2 = 2;
    c: Int as uint3 = 3;
    d: Int as uint4 = 4;
}

contract TestContract {
    tiny: Tight = Tight{};
    init() {}
}
