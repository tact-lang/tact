struct BoolChain {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
}

contract ManyBools {
    chain: BoolChain;

    init() {
        self.chain = BoolChain{
            a:true,b:false,c:true,d:false,e:true,f:false,g:true
        };
    }
}