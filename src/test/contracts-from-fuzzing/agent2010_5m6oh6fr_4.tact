struct Inner {
    a: Int;
    b: Bool?;
    c: Address;
    d: String;
}

contract ContractTest {
    s1: Inner;
    s2: Inner;
    s3: Inner;
    
    init() {
        self.s1 = Inner{ a:1, b:true, c: myAddress(), d: "A" };
        self.s2 = Inner{ a:2, b:false, c: myAddress(), d: "B" };
        self.s3 = Inner{ a:3, b:null, c: myAddress(), d: "C" };
    }
}
