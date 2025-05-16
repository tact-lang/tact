struct Chain {
    a: Int;
    mid: Chain2;
}

struct Chain2 {
    b: Bool;
    mid: Chain3;
}

struct Chain3 {
    c: String;
    d: Int?;
}

contract LongDeepChain {
    chain: Chain;

    init() {
        self.chain = Chain{
            a:1,
            mid: Chain2{
                b:true,
                mid: Chain3{c:"x", d:null}
            }
        };
    }
}