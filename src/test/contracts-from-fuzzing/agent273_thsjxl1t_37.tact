message(44) NumberMsg { val: Int }

struct MsgWrap {
    num: NumberMsg;
}

struct OuterWrap {
    wrap: MsgWrap;
}

contract Test37 {
    f: OuterWrap;

    init() {
        self.f = OuterWrap {
            wrap: MsgWrap {
                num: NumberMsg { val: 9 }
            }
        };
    }
}