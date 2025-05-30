contract ManyManyFields {
    a0: Int = 0;
    a1: Int = 1;
    a2: Bool = false;
    a3: Int? = null;
    a4: String = "";
    a5: Bool? = null;
    a6: Int = 6;
    a7: Int = 7;
    a8: Bool = true;
    a9: String = "x";
    a10: Int? = null;
    a11: String? = null;
    a12: Bool = true;
    a13: Int = 13;
    a14: Bool? = null;
    a15: String? = null;

    init() {
        self.a0=0;self.a1=1;self.a2=false;self.a3=null;
        self.a4="";self.a5=null;self.a6=6;self.a7=7;
        self.a8=true;self.a9="x";self.a10=null;self.a11=null;
        self.a12=true;self.a13=13;self.a14=null;self.a15=null;
    }
}

contract Use {
    receive() {
        let dummy: ManyManyFields? = null;
    }
}