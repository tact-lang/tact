struct Simple {
    a: Int;
    b: Bool;
}

contract ArrayLike {
    s0: Simple;
    s1: Simple;
    s2: Simple;
    s3: Simple;
    s4: Simple;

    init() {
        self.s0 = Simple{ a:0, b:true };
        self.s1 = Simple{ a:1, b:false };
        self.s2 = Simple{ a:2, b:true };
        self.s3 = Simple{ a:3, b:false };
        self.s4 = Simple{ a:4, b:true };
    }
}