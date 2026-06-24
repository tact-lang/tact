struct S {
    a: Int;
    b: Bool;
}

contract MultipleStructsFields {
    f1: S;
    f2: S;
    init() {
        self.f1 = S { a:1, b:false };
        self.f2 = S { a:2, b:true };
    }
}