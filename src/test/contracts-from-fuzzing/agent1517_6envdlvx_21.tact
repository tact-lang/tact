message(77) Ping { v: Int; }

contract OptMsgInit {
    m: Ping?;
    init() {
        self.m = Ping{ v: 101 };
    }
}