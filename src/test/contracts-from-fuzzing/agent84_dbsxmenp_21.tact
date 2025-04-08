contract MixedInlineAndInit {
    v1: Int = 1;
    v2: Bool;
    v3: String = "abc";
    v4: Int;
    init() {
        self.v2 = true;
        self.v4 = 99;
    }
}
