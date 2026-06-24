contract LargeStrings {
    s1: String;
    s2: String;

    init() {
        self.s1 = "A very very very long string literal exceeding usual..";
        self.s2 = "Another super long string literal to test storage capacity.";
    }
}