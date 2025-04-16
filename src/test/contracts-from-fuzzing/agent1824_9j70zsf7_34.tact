// Very wide contract, many mixed primitive fields (30 fields)
contract HugeFlat {
    a1: Int; a2: Int; a3: Int; a4: Int; a5: Int;
    b1: Bool; b2: Bool; b3: Bool; b4: Bool; b5: Bool;
    s1: String; s2: String; s3: String; s4: String; s5: String;
    addr1: Address; addr2: Address; addr3: Address; addr4: Address; addr5: Address;
    sl1: Slice; sl2: Slice; sl3: Slice; sl4: Slice; sl5: Slice;

    init() {
        self.a1=1; self.a2=2; self.a3=3; self.a4=4; self.a5=5;
        self.b1=true; self.b2=false; self.b3=true; self.b4=false; self.b5=true;
        self.s1="1"; self.s2="2"; self.s3="3"; self.s4="4"; self.s5="5";
        self.addr1=myAddress(); self.addr2=myAddress(); self.addr3=myAddress(); self.addr4=myAddress(); self.addr5=myAddress();
        self.sl1=emptyCell().asSlice(); self.sl2=emptyCell().asSlice(); self.sl3=emptyCell().asSlice(); self.sl4=emptyCell().asSlice(); self.sl5=emptyCell().asSlice();
    }
}
