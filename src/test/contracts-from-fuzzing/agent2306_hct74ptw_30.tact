struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract MultiTypeOptional {
    opt: Nested?;

    init() {
        self.opt = null;
    }
}
