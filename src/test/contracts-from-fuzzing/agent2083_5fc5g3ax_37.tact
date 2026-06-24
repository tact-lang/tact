contract MixedDefaultsAndInit {
    a: Int = 5;
    b: Bool;
    c: String = "default";

    init() {
        self.b = true;
        self.c = "changed";
    }
}
