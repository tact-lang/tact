struct RecA {
    b: RecB?;
}

struct RecB {
    c: RecC?;
}

struct RecC {
    val: Bool?;
}

contract NestedRecOpt {
    root: RecA = RecA{b: RecB{c: RecC{val:null}}};
    init() {}
}