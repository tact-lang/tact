struct S {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
}

contract MultiInt {
    s: S;

    init() {
        self.s = S{a:1,b:2,c:3,d:4,e:5,f:6};
    }
}