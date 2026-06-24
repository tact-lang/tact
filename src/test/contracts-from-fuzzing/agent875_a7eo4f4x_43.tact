struct PrimitiveChain {
    i: Int;
    b: Bool;
    s: String;
    io: Int?;
    bo: Bool?;
    so: String?;
}

contract PrimitiveChainTest {
    p: PrimitiveChain;
    init() {
        self.p = PrimitiveChain{
            i:5, b:true, s:"hello",
            io:null, bo:false, so:null
        };
    }
}