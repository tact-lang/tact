struct LVL4 {
    f1: Int;
}
struct LVL3 {
    lv4: LVL4;
}
struct LVL2 {
    lv3: LVL3;
}
struct LVL1 {
    lv2: LVL2;
}

contract DeepChain {
    chain: LVL1;

    init() {
        self.chain = LVL1{ lv2: LVL2{ lv3: LVL3{ lv4: LVL4{ f1: 7 } } } };
    }
}