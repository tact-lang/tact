struct S21 {
    a: Int;
    b: Bool;
    c: String?;
    d: Address;
}

contract Test22 {
    s1: S21;
    s2: S21;
    s3: S21;
    init() {
        self.s1=S21{a:1,b:true,c:null,d:myAddress()};
        self.s2=S21{a:2,b:false,c:"x",d:myAddress()};
        self.s3=S21{a:3,b:true,c:null,d:myAddress()};
    }
}