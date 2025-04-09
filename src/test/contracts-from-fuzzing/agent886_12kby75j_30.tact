message(0x99887766) SubMessage {
    n: Int;
}

struct Wrap {
    s: SubMessage;
}

contract TestContract {
    w: Wrap;

    init() {
        self.w = Wrap{
            s: SubMessage{ n: 42 }
        };
    }
}