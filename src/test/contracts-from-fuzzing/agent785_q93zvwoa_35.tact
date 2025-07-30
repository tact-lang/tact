struct HasBool {
    f: Bool;
}

contract OptEmptyNext {
    opt: HasBool?;
    a: Int;
    b: Bool;

    init() {
        self.opt = null;
        self.a = 42;
        self.b = true;
    }
}