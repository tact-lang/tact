struct S {
    a: Int;
    b: Bool;
}

contract X {
    s1: S;
    s2: S;
    optS: S?;

    init() {
        self.s1 = S{a:1,b:true};
        self.s2 = S{a:2,b:false};
        self.optS = null;
    }
}