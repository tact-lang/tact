struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract Arranged {
    s: S;
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;

    init() {
        self.s = S{a:1,b:true,c:"test"};
        self.a=2; self.b=3; self.c=4; self.d=5; self.e=6; self.f=7; self.g=8;
    }
}
