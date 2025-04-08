struct Inner {
    a: Int;
    b: Bool;
}

contract TestNestedOptional {
    s: Inner?;

    init() {
        self.s = null;
    }
}