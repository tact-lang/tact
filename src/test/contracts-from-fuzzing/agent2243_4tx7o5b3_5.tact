struct Deeply {
    val: Int;
}

struct MidLevel {
    d1: Deeply;
    d2: Deeply;
}

contract MultiNested {
    first: MidLevel;
    second: MidLevel;
    flag: Bool;

    init() {
        self.first = MidLevel{d1: Deeply{val:1}, d2: Deeply{val:2}};
        self.second = MidLevel{d1: Deeply{val:3}, d2: Deeply{val:4}};
        self.flag = true;
    }
}
