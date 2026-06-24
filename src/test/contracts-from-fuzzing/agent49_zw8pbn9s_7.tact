struct S { a: Int; b: Bool; c: String; }

contract ListOfStructs {
    s0: S;
    s1: S;
    s2: S;

    init() {
        let t = S{a:1, b:true, c:"x"};
        self.s0 = t;
        self.s1 = t;
        self.s2 = t;
    }
}