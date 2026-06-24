struct Inner { a: Int; }

contract OptionalStructReassign {
    s: Inner?;
    init() {
        self.s = null;
        self.s = Inner{a:5};
    }
}