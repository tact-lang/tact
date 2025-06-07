message(0xBB) M {
    num: Int;
    flag: Bool;
}

struct Wrap {
    value: M?;
}

contract OptMsgPersist {
    wrapOpt: Wrap?;

    init() {
        self.wrapOpt = Wrap{
            value: M{ num: 77, flag: true }
        };
    }
}
