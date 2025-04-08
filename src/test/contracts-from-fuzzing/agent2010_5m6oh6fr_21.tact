contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    s: String;

    init() {
        self.a=0; self.b=true; self.c=myAddress(); self.s="";
    }
}