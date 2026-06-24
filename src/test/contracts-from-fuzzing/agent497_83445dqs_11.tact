contract LongStrings {
    a: String;
    b: String;

    init() {
        self.a = "This is a very very very long string just to see if any serialization bugs happen here.";
        self.b = "Another lengthy string with various characters: ~!@#$%^&*()_+{}|:<>?[];',./`";
    }
}