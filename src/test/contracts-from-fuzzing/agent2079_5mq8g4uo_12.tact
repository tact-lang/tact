contract TestContract {
    bigStr: String = "a very very very long string just to check large literal serialization";

    init() {
        self.bigStr = "new very very very long string after init";
    }
}