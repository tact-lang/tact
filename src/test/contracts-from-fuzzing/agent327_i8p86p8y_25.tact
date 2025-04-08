message(77) M {
    a: Int;
}

contract OptMsgInitTest {
    m: M?;
    init() {
        self.m = M{a: 42};
    }
}