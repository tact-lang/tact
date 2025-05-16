contract AllTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    oi: Int?;
    ob: Bool?;
    os: String?;
    oa: Address?;

    init() {
        self.i=1; self.b=true; self.s="s"; self.a=myAddress();
        self.oi=null; self.ob=false; self.os=null; self.oa=null;
    }
}