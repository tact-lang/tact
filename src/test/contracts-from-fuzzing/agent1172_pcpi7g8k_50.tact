struct S {
    a: Int;
    b: Bool?;
}

contract Opts {
    s: S;

    init() {
        self.s = S{ a:10, b:null };
    }
}