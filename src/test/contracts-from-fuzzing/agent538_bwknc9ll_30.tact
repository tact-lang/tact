struct Sub {
    si: Int;
    sb: Bool;
    ss: String;
}

contract OptionalSubs {
    o1: Sub?;
    o2: Sub?;

    init() {
        self.o1 = null;
        self.o2 = null;
    }
}