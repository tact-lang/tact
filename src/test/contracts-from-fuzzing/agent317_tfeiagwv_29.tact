// Test optional string + default string
contract OptionString {
    s: String?;
    t: String = "def";

    init() {
        self.s = null;
    }
}