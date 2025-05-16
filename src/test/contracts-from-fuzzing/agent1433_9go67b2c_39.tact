struct Inside {
    val: Int;
    str: String;
}

struct MidInside {
    a: Int;
    s: Inside;
}

contract ContractStructInStruct {
    m: MidInside;

    init() {
        self.m = MidInside{ a:1, s: Inside{ val:42, str:"hi" } };
    }
}
