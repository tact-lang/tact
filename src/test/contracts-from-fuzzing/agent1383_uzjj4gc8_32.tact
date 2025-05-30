struct Inner {
    a: Int;
    b: Bool;
}

contract ArrayChain {
    a0: Inner;
    a1: Inner;
    a2: Inner;
    init() {
        self.a0 = Inner{ a:1,b:true };
        self.a1 = Inner{ a:2,b:false };
        self.a2 = Inner{ a:3,b:true };
    }
}