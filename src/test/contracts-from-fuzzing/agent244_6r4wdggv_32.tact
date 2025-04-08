struct IntBoolChain {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
}

contract AlternatingFields {
    chain: IntBoolChain;

    init() {
        self.chain = IntBoolChain{
            a:1, b:true, c:2, d:false, e:3, f:true
        };
    }
}