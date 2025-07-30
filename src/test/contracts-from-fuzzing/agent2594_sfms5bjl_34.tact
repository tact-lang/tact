contract ManyAddresses {
    a: Address;
    b: Address?;
    c: Address;
    d: Address?;

    init() {
        self.a=myAddress();
        self.b=null;
        self.c=myAddress();
        self.d=null;
    }
}