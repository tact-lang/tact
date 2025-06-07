struct DeepNest {
    x: Int;
    opt: Int?;
}

struct MidNest {
    dn: DeepNest;
    flag: Bool;
}

contract ComboNest {
    middle: MidNest;

    init() {
        self.middle = MidNest{
            dn: DeepNest{ x: 5, opt: null },
            flag: true
        };
    }
}
