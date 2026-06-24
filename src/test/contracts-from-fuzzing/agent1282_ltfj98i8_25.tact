// Edge case optional struct containing mixed defaults
struct MixedDefaults {
    a: Int = 5;
    b: Int? = null;
    c: String = "abc";
    d: String? = null;
    e: Bool = true;
    f: Bool? = null;
}

contract MixedDefaultsTest {
    content: MixedDefaults?;

    init() {
        self.content = null;
    }
}