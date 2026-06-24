struct DeepNest {
    f0: Int;
    f1: Bool;
    f2: String;
}

struct Holder {
    nested: DeepNest;
    toggle: Bool;
    caption: String;
}

contract TestDeeperNest {
    h: Holder;

    init() {
        self.h = Holder{
            nested: DeepNest{ f0:1, f1:true, f2:"deep" },
            toggle: false,
            caption: "holder"
        };
    }
}