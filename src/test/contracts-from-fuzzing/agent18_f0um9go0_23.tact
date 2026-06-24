struct S {
    a: Int;
    b: Bool?;
}
contract SInOptional {
    s: S?;
    init() {
        self.s = null;
    }
}
