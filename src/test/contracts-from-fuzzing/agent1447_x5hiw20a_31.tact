contract TwentyPrimitives {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Bool;
    a7: Bool;
    a8: Bool;
    a9: Bool;
    a10: Bool;
    a11: String;
    a12: String;
    a13: String;
    a14: String;
    a15: String;
    a16: Address;
    a17: Address;
    a18: Address;
    a19: Address;
    a20: Address;

    init() {
        self.a1=1;self.a2=2;self.a3=3;self.a4=4;self.a5=5;
        self.a6=true;self.a7=false;self.a8=true;self.a9=false;self.a10=true;
        self.a11="a";self.a12="b";self.a13="c";self.a14="d";self.a15="e";
        self.a16=myAddress();self.a17=myAddress();self.a18=myAddress();self.a19=myAddress();self.a20=myAddress();
    }
}