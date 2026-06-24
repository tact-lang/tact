struct DeepNest3 {
    dflag: Bool;
    dval: Int;
}

struct DeepNest2 {
    cflag: Bool;
    cval: Int;
    next: DeepNest3;
}

struct DeepNest1 {
    bflag: Bool;
    bval: Int;
    next: DeepNest2;
}

struct RootNest {
    aflag: Bool;
    aval: Int;
    next: DeepNest1;
}

contract TestContract {
    data: RootNest;

    init() {
        self.data = RootNest{
            aflag: true,
            aval: 1,
            next: DeepNest1{
                bflag: false,
                bval: 2,
                next: DeepNest2{
                    cflag: true,
                    cval: 3,
                    next: DeepNest3{
                        dflag: false,
                        dval: 4
                    }
                }
            }
        };
    }
}
