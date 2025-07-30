struct Nested {
    a: Int;
    b: Bool;
}

contract TestDeepOptional {
    opt: Nested?;

    init() {
        self.opt = null;
    }
}