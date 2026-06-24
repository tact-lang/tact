// contract with very long list of primitive fields
contract HugeFlat {
    a0: Int;  a1: Int;  a2: Int;  a3: Int;  a4: Int;  a5: Int;  a6: Int;  a7: Int;  a8: Int;  a9: Int;
    b0: Bool;  b1: Bool;  b2: Bool;  b3: Bool;  b4: Bool;  b5: Bool;  b6: Bool;
    s0: String; s1: String; s2: String; s3: String; s4: String;
    addr0: Address; addr1: Address; addr2: Address;

    init() {
        self.a0=0; self.a1=1; self.a2=2; self.a3=3; self.a4=4; self.a5=5; self.a6=6; self.a7=7; self.a8=8; self.a9=9;
        self.b0=true; self.b1=false; self.b2=true; self.b3=false; self.b4=true; self.b5=false; self.b6=true;
        self.s0="a"; self.s1="b"; self.s2="c"; self.s3="d"; self.s4="e";
        self.addr0=myAddress(); self.addr1=myAddress(); self.addr2=myAddress();
    }
}