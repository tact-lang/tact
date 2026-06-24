message(1) DataMsg {
    num: Int;
}

message(2) StatusMsg {
    ok: Bool;
}

struct Complex {
    dmsg: DataMsg?;
    smsg: StatusMsg;
}

contract TestContract {
    state: Complex;

    init() {
        self.state = Complex{
            dmsg: null,
            smsg: StatusMsg{ ok: true },
        };
    }
}