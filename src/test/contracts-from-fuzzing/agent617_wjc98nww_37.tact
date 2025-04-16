struct NumWrap {
    n: Int;
}

contract AssignStructTwice {
    s: NumWrap;
    init() {
        let a = NumWrap{ n:1};
        let b = NumWrap{ n:2};
        self.s = a;
        self.s = b;
    }
}
