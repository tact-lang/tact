struct InnerMost {
    z: Int;
}

struct MidLvl {
    inner: InnerMost;
}

struct OuterMost {
    mid: MidLvl;
}

contract DeepLevels {
    nested: OuterMost;
    init() {
        self.nested = OuterMost{ mid: MidLvl{ inner: InnerMost { z:99 } } };
    }
}