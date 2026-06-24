struct S {
    a: Int; b: Bool;
}

contract SerializeStructVariants {
    s257: Int as int257;
    s: S;
    s2: S;
    
    init() {
        self.s257 = -1;
        self.s = S{a:1,b:true};
        self.s2 = S{a:2,b:false};
    }
}