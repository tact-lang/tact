struct DeepNestingA {
    x: Int;
}
struct DeepNestingB {
    a: DeepNestingA;
}
struct DeepNestingC {
    b: DeepNestingB;
}
struct DeepNestingD {
    c: DeepNestingC;
}

contract FourLevelsDeep {
    val: DeepNestingD;

    init() {
        self.val = DeepNestingD{c: DeepNestingC{b: DeepNestingB{a: DeepNestingA{x: 777}}}};
    }
}