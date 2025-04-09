message(55) InnerMsg { x: Int; }

struct Holder {
    inner: InnerMsg?;
}

contract MsgOptionalInStruct {
    h: Holder;

    init() {
        self.h = Holder{ inner: null };
    }
}