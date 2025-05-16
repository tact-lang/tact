message(100) AMsg {}
message(101) BMsg {}

struct TwoMsgs {
    a: AMsg?;
    b: BMsg?;
}

contract DoubleMsgOpt {
    data: TwoMsgs;

    init() {
        self.data = TwoMsgs{
            a: null,
            b: null
        };
    }
}
