struct S {
    a: Int;
    b: Bool;
}

contract ArrayOfStructs {
    a: S;
    b: S;
    c: S;
    d: S;

    init() {
        self.a = S{a:1,b:true};
        self.b = S{a:2,b:false};
        self.c = S{a:3,b:true};
        self.d = S{a:4,b:false};
    }
}