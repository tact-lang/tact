struct S {
    i: Int;
    b: Bool;
}

contract Test {
    opt: S?;
    init() {
        self.opt = null;
    }
}