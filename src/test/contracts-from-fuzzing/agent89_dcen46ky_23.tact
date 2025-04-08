struct S {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
    f: Int?;
}

contract Fuzz23 {
    test: S?;

    init() {
        self.test = null;
    }
}