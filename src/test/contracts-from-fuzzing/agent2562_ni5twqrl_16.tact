contract MixDefaults {
    a: Int = 1;
    b: Bool;
    c: Address;
    d: String = "text";

    init() {
        self.b = true;
        self.c = myAddress();
    }
}