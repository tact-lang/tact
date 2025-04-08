contract MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;

    init() {
        self.i = 10;
        self.b = true;
        self.s = "hello";
        self.a = myAddress();
    }
}