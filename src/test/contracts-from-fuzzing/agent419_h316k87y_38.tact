// test string and optional string defaults
contract ComboDefaults {
    a: String = "hi";
    b: String? = null;

    init() {
        self.a = "hi";
        self.b = null;
    }
}