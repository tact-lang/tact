contract MixedInit {
    a: Int = 1;
    b: Bool; 
    c: Address;
    d: Int?;
    e: Bool?;

    init() {
        self.b = true;
        self.c = myAddress();
        self.d = null;
        self.e = null;
    }
}