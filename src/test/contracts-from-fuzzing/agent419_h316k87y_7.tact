struct Nested {
    a: Int?;
    b: Bool;
}

contract Test {
    opt: Nested?;

    init() {
        self.opt = null;
    }
}