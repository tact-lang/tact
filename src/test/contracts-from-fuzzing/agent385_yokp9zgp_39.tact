message(2) MsgOpt { x: Int }

struct Container { m: MsgOpt? }

contract OptMsgInStruct {
    f: Container;

    init() {
        self.f = Container { m: null };
    }
}
