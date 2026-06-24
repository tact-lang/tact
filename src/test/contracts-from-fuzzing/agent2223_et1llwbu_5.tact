struct Inner {
    a: Int;
    b: Bool;
}

contract OptionalNestedStructInit {
    opt: Inner?;

    init() {
        self.opt = null;
    }
}