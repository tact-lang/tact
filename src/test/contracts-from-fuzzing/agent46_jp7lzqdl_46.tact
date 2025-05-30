message(0xA1) MA { val: Int }
message(0xA2) MB { val: Int }

struct DoubleMsg {
    a: MA?;
    b: MB?;
}

contract OptMsgs {
    data: DoubleMsg;

    init() {
        self.data = DoubleMsg{
            a: null,
            b: null
        };
    }
}
