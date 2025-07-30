contract MixedInit {
    a: Int = 1;
    b: Bool;
    c: String = "str";
    d: Address;

    init() {
        self.b = true;
        self.d = myAddress();
    }
}