struct InnerMost {
    x: Int;
}

struct MLevel3 {
    inner: InnerMost;
}

struct MLevel2 {
    inner: MLevel3;
}

struct MLevel1 {
    inner: MLevel2;
}

contract DeepMultiStruct {
    s: MLevel1;

    init() {
        self.s = MLevel1{inner:MLevel2{inner:MLevel3{inner:InnerMost{x:123}}}};
    }
}