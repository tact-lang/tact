contract LargeStrings {
    s1: String = "A";
    s2: String = "This is a longer test string";
    s3: String = "Another one just to fill more";
    s4: String;

    init() {
        self.s4 = "Last one, dynamically assigned";
    }
}
