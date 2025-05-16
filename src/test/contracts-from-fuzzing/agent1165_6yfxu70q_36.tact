struct AroundBool {
    first: Int;
    flag: Bool;
    last: Int;
}

contract IntBoolInt {
    s: AroundBool;

    init() {
        self.s = AroundBool{ first: 1, flag: true, last: 2 };
    }
}
