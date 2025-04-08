message(0x00112233) FooMsg {
    bar: Int;
}

struct Holder {
    x: Int;
    y: String;
}

contract MixedStructMessage {
    thing: Holder;
    msgOpt: FooMsg?;
    intOpt: Int?;
    boolOpt: Bool?;

    init() {
        self.thing = Holder{ x: 7, y: "hi" };
        self.msgOpt = null;
        self.intOpt = null;
        self.boolOpt = true;
    }
}
