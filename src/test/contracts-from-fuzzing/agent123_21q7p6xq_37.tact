struct S {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract TestManyOptionals {
    opt1: S?;
    opt2: S?;
    opt3: S?;

    init() {
        self.opt1 = S{ a:1, b:true, c:"x", d:myAddress() };
        self.opt2 = null;
        self.opt3 = null;
    }
}