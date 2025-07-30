struct S {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract SomeOpts {
    opt: S?;

    init() {
        self.opt = S{ a:null, b:null, c:null };
    }
}