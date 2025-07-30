struct LongOptionalChain {
    a: Int?; 
    b: Int?; 
    c: Int?; 
    d: Int?; 
    e: Int?; 
    f: Int?; 
    g: Int?; 
    h: Int?; 
    i: Int?;
}

contract TestContract {
    opt: LongOptionalChain;

    init() {
        self.opt = LongOptionalChain{
            a: null, b: null, c: null, d: null, e: null,
            f: 6, g: 7, h: null, i: 9
        };
    }
}