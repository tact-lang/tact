contract DefaultsAndInit {
    a: Int = 1;
    b: Bool;
    c: Int;
    d: String = "hey";
    e: Address;

    init() {
        self.b = true;
        self.c = 5;
        self.e = myAddress();
    }
}