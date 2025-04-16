struct RecA {
    f: Int;
    optB: RecB?;
}

struct RecB {
    flag: Bool;
    optC: RecC?;
}

struct RecC {
    num: Int;
    optStr: String?;
}

contract ComposedOptionalsDeep {
    ra: RecA;

    init() {
        self.ra = RecA{
            f: 5,
            optB: RecB{ flag:true, optC: RecC{ num:7, optStr:null } }
        };
    }
}
