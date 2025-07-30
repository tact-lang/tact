struct S {
    a: Int;
    b: Bool;
}

struct T {
    s1: S;
    s2: S;
    s3: S;
    s4: S;
}

contract Contract {
    d: T;
    init() {
        self.d = T{
            s1: S{ a:1, b:true },
            s2: S{ a:2, b:false },
            s3: S{ a:3, b:true },
            s4: S{ a:4, b:false }
        };
    }
}