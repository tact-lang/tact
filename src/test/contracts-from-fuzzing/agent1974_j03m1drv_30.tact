struct Simple {
    a: Int;
    b: Bool;
}

contract ManySimples {
    s1: Simple;
    s2: Simple;
    s3: Simple;
    s4: Simple;
    s5: Simple;
    s6: Simple;

    init() {
        self.s1 = Simple{ a:1, b:true };
        self.s2 = Simple{ a:2, b:false };
        self.s3 = Simple{ a:3, b:true };
        self.s4 = Simple{ a:4, b:false };
        self.s5 = Simple{ a:5, b:true };
        self.s6 = Simple{ a:6, b:false };
    }
}
