struct LongChain {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
}

contract TestContract {
    f1: LongChain;
    f2: LongChain;
    f3: LongChain;
    f4: LongChain;
    f5: LongChain;

    init() {
        self.f1 = LongChain{ a:1,b:1,c:1,d:1,e:1,f:1,g:1,h:1,i:1,j:1 };
        self.f2 = LongChain{ a:2,b:2,c:2,d:2,e:2,f:2,g:2,h:2,i:2,j:2 };
        self.f3 = LongChain{ a:3,b:3,c:3,d:3,e:3,f:3,g:3,h:3,i:3,j:3 };
        self.f4 = LongChain{ a:4,b:4,c:4,d:4,e:4,f:4,g:4,h:4,i:4,j:4 };
        self.f5 = LongChain{ a:5,b:5,c:5,d:5,e:5,f:5,g:5,h:5,i:5,j:5 };
    }
}