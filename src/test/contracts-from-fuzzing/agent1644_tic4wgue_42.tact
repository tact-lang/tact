struct Lvl2 {
    val: Int as int8 = -1;
    flag: Bool = false;
}

struct Lvl1 {
    inner: Lvl2 = Lvl2{};
    count: Int? as uint4 = null;
}

contract DeepSerializeDefaults {
    state: Lvl1 = Lvl1{};

    init() {}
}