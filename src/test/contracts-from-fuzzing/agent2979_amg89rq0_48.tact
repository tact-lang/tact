struct S {
    a: Int; 
    opt: Int?;
    b: Bool?;
    s: String;
}

contract ComplexAssignment {
    foo: S;
    init() {
        self.foo = S{ a:1, opt:null, b:true, s:"hello" };
    }
}