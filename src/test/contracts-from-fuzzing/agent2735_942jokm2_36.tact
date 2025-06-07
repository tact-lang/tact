struct BaseS {
    x: Int;
    y: String;
}

message(50) LeafMsg {
    leafVal: Int;
}

message(51) MidMsg {
    leafA: LeafMsg;
    leafB: LeafMsg?;
    note: String;
}

struct Container {
    base: BaseS;
    msgOpt: MidMsg?;
    other: Int;
}

contract ComplexNest {
    store: Container;

    init() {
        self.store = Container{
            base: BaseS{ x: 7, y: "hi" },
            msgOpt: null,
            other: 101,
        };
    }
}
