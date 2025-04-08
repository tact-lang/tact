struct S {
    i: Int;
    b: Bool;
    s: String;
}

contract ArrayLike {
    e0: S;
    e1: S;
    e2: S;
    e3: S;
    e4: S;

    init() {
        self.e0 = S{ i:0, b:true, s:"a" };
        self.e1 = S{ i:1, b:false, s:"b" };
        self.e2 = S{ i:2, b:true, s:"c" };
        self.e3 = S{ i:3, b:false, s:"d" };
        self.e4 = S{ i:4, b:true, s:"e" };
    }
}