contract MixScalarComposite {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    
    init() {
        self.a = 1;
        self.b = "abc";
        self.c = true;
        self.d = myAddress();
    }
}
