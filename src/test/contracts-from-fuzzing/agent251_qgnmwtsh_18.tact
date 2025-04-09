struct S {
    i: Int;
    b: Bool;
    s: String;
}

contract SArray {
    s0: S;
    s1: S;
    s2: S;

    init() {
        self.s0 = S{ i:1, b:true, s:"a"};
        self.s1 = S{ i:2, b:false, s:"b"};
        self.s2 = S{ i:3, b:true, s:"c"};
    }
}