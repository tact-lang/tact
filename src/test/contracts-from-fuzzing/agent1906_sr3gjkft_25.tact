// optional struct at contract level
struct S {
    a: Int;
    b: Int;
}

contract OuterOpt {
    s: S?;

    init() {
        self.s = null;
    }
}
