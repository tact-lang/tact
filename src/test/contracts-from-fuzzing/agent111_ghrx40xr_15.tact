// Test struct with mixed default and optional fields
struct Mixed {
    a: Int = 5;
    b: Bool?;
    c: String = "hi";
    d: Int?;
}

contract MixedDefaultsOptionals {
    val: Mixed;
    init() {
        self.val = Mixed{};
    }
}