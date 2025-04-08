struct SmallInts {
    a: Int as uint8 = 5;
    b: Int as uint4 = 3;
}

struct Outer {
    s: SmallInts = SmallInts{};
}

contract TestContract {
    storage: Outer = Outer{};
    init() {}
}
