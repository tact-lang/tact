struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract Test {
    sopt: S?;
    init() {
        self.sopt = null;
    }
}