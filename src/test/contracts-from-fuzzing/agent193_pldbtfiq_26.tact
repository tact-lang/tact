struct One {
    a: Int;
}

struct Two {
    b: Bool;
}

struct Three {
    c: String;
}

contract MultipleStructs {
    s1: One;
    s2: Two;
    s3: Three;

    init() {
        self.s1=One{a:1}; self.s2=Two{b:true}; self.s3=Three{c:"x"};
    }
}