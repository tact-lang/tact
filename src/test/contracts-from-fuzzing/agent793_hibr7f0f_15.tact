struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyStructsVar {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{a:1, b:true, c:"a"};
        self.s2 = S{a:2, b:false, c:"b"};
    }
}