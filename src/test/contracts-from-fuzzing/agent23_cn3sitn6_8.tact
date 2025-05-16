struct MegaNested {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    f1: Int;
    f2: InnerBase;
}

struct Inner2 {
    f3: Bool;
    f4: InnerBase;
}

struct InnerBase {
    baseVal: Int;
    optFlag: Bool?;
}

contract UltraNest {
    mega: MegaNested;
    
    init() {
        self.mega = MegaNested{
            inner1: Inner1{ f1: 1, f2: InnerBase{ baseVal: 10, optFlag: null } },
            inner2: Inner2{ f3: true, f4: InnerBase{ baseVal: 20, optFlag: true } }
        };
    }
}