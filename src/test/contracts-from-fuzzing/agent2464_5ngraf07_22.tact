struct FourOptionNested {
    i1: InnerOpt?;
    i2: InnerOpt?;
    i3: InnerOpt?;
    i4: InnerOpt?;
}

struct InnerOpt {
    val: Int;
}

contract OptFourNested {
    s: FourOptionNested;

    init() {
        self.s = FourOptionNested{
            i1:null,
            i2:InnerOpt{val:1},
            i3:null,
            i4:InnerOpt{val:2}
        };
    }
}
