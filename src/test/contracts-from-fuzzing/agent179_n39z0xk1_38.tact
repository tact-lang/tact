contract ManyAddresses {
    a: Address;
    b: Address;
    c: Address;
    d: Address;
    e: Address;

    init() {
        let my = myAddress();
        self.a=my; self.b=my; self.c=my; self.d=my; self.e=my;
    }
}