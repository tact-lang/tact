contract MixedInit {
    a: Int = 1;
    b: Bool = false;
    c: Address;
    d: Int;

    init() {
        self.b = true;
        self.c = myAddress();
        self.d = 42;
    }
}