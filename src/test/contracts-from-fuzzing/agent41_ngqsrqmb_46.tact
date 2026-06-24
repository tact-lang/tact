// Test persistent contract field with optional String with default assigned null
contract DefaultOptNull {
    s: String? = null;
    init() {
        self.s = null;
    }
}