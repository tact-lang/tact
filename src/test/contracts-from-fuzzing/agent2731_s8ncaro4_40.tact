struct X {
    a: Int;
}
struct Y {
    b: Int;
}
struct Z {
    c: Int;
}

contract WideFlat {
    f1: Int;
    f2: String;
    f3: Bool;
    s1: X;
    s2: Y;
    s3: Z;

    init() {
        self.f1=1; self.f2="x"; self.f3=true;
        self.s1=X{a:1}; self.s2=Y{b:2}; self.s3=Z{c:3};
    }
}