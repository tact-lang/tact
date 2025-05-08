struct StrNest {
    s: String;
}

struct IntNest {
    i: Int;
}

struct BoolNest {
    b: Bool;
}

struct ComboNest {
    sn: StrNest;
    inest: IntNest;
    bn: BoolNest;
}

contract MultipleTypesNested {
    x: ComboNest;
    init() {
        self.x = ComboNest{
            sn: StrNest{ s: "hi" },
            inest: IntNest{ i: 88 },
            bn: BoolNest{ b: true },
        };
    }
}
