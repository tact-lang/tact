struct S { b: Bool; i: Int; s: String; }

contract C1 {
    s1: S;
    s2: S;
    s3: S;
    s4: S;

    init() {
        self.s1 = S{ b:true, i:1, s:"a" };
        self.s2 = S{ b:false, i:2, s:"b" };
        self.s3 = S{ b:true, i:3, s:"c" };
        self.s4 = S{ b:false, i:4, s:"d" };
    }
}