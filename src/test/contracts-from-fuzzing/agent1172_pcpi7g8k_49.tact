struct S {
    a: Int;
    b: Int?;
}

contract StructOpt {
    s: S;

    init() {
        self.s = S{ a:5, b: null };
    }
}