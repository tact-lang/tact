struct BigMixedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract BigMixedOptionalContract {
    val: BigMixedOptional = BigMixedOptional{
        a:null,b:true,c:"hi",d:5,e:null,f:null
    };
    receive() {
        if (self.val.d != null) { let _ = self.val.d!!; }
    }
}