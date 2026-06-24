// Deep optional message in struct in contract
message(111) MsgV {
    payload: String?;
}

struct SIn {
    inner: MsgV?;
}

contract OptMsgDeep {
    f: SIn;

    init() {
        self.f = SIn{ inner: null };
    }
}