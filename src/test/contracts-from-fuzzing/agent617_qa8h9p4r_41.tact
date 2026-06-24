message(77) M {}

contract OptMsgNullInit {
    m: M?;
    init() {
        self.m = null;
    }
}