struct One {
    f: Int;
}

contract OptTypePers {
    maybe: One?;

    init() {
        self.maybe = null;
    }
}
