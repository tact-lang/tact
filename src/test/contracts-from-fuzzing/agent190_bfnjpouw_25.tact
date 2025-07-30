message(0x4) FooMsg {
    n: Int?;
}

struct BarStruct {
    txt: String?;
}

struct Combo {
    amsg: FooMsg?;
    bm: FooMsg?;
    asct: BarStruct?;
    bsct: BarStruct?;
}

contract TestContract {
    rec: Combo;

    init() {
        self.rec = Combo{
            amsg: null,
            bm: null,
            asct: null,
            bsct: null,
        };
    }
}