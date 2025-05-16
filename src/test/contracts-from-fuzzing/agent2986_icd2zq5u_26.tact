// multiple fields, mixing optional and default
contract MixOptionDefaults {
    i: Int = 42;
    b: Bool?;
    s: String = "hello";

    init() {
        self.b = null;
    }
}