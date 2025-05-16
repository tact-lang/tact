message(42) OptMsg { x: Int; }

contract OptMsgSet {
    m: OptMsg?;

    init() {
        self.m = OptMsg{ x: 55 };
    }
}