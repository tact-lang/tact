struct IntOrdering {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int64;
}

contract SerializeOrderContract {
    vals: IntOrdering;

    init() {
        self.vals=IntOrdering{a:255,b:65535,c:-123456789};
    }
}
