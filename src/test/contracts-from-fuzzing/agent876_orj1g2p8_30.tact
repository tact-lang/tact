struct S {
    a: Int;
    b: String;
    c: Bool;
}

contract MultipleStructFields {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{a:1, b:"x", c:true};
        self.s2 = S{a:2, b:"y", c:false};
    }
}