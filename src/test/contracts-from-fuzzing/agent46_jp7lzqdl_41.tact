message(0x77) MsgC { c: Int }

struct S {
    opt: MsgC?;
}

contract OptionalMsgStruct {
    data: S;

    init() {
        self.data = S{ opt: null };
    }
}
