struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract WideWide {
    f1: S;
    f2: S;
    f3: S;
    f4: S;
    f5: S;

    init() {
        self.f1 = S{a:1,b:true,c:"a"};
        self.f2 = S{a:2,b:false,c:"b"};
        self.f3 = S{a:3,b:true,c:"c"};
        self.f4 = S{a:4,b:false,c:"d"};
        self.f5 = S{a:5,b:true,c:"e"};
    }
}