struct LongOptionalChain {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
}

contract TestContract {
    data: LongOptionalChain;

    init() {
        self.data = LongOptionalChain{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null
        };
    }
}