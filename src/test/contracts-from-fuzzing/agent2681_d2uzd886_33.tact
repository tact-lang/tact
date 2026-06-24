struct Sub {
    flag: Bool;
}

contract OptionalSub {
    s: Sub?;
    init() {
        self.s = null;
    }
}