struct SBoolOpt {
    f1: Bool?;
    f2: Bool?;
}

struct SIntOpt {
    x: Int?;
}

contract NestedOpts {
    so: SBoolOpt;
    si: SIntOpt;

    init() {
        self.so = SBoolOpt{ f1:null, f2:null };
        self.si = SIntOpt{ x:null };
    }
}