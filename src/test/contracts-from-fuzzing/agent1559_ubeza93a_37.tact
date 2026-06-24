contract LargeStringDefaults {
    s: String = "This is a large default string value to verify persistence and serialization in contract storage";

    init() {
        self.s = "Another long string";
    }
}