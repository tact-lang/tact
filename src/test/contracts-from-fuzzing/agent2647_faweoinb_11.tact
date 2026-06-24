struct S {
    n: Int;
    o: Int?;
    s: String;
}

contract ArrayLike {
    s1: S;
    s2: S;
    s3: S;
    s4: S;

    init() {
        self.s1 = S{n:1, o:2, s:"a"};
        self.s2 = S{n:3, o:null, s:"b"};
        self.s3 = S{n:4, o:5, s:"c"};
        self.s4 = S{n:6, o:null, s:"d"};
    }
}