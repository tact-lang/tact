contract MixedDefaults {
    x: Int = 5;
    y: Bool;
    s: String = "yo";
    addr: Address;
    
    init() {
        self.y = true;
        self.addr = myAddress();
    }
}