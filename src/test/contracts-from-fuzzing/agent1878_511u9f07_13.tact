struct S {
    val8: Int as int8;
    optStr: String?;
}

contract Test {
    s: S;

    init() {
        self.s = S{ val8: -5, optStr: null };
    }
}