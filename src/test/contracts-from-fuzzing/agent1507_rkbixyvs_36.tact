struct OuterWrap {
    s: String;
    opt: Int?;
}

contract ManyPrimitiveFields {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    s1: String;
    s2: String?;
    s3: String;
    s4: String?;
    ow: OuterWrap;

    init() {
        self.a1=1; self.a2=2; self.a3=3; self.a4=4; self.a5=5; self.a6=6; self.a7=7;
        self.s1="X"; self.s2=null; self.s3="Y"; self.s4="Z";
        self.ow = OuterWrap{ s: "wrap", opt: null };
    }
}
