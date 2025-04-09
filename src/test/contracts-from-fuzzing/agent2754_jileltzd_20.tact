struct SmallS {
    v: Int;
}

struct WrapOpt {
    s: SmallS?;
}

contract OptStructInStruct {
    data: WrapOpt;

    init() {
        self.data = WrapOpt{ s: null };
    }
}
