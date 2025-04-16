contract LargeStrings {
    s1: String;
    s2: String;

    init() {
        self.s1 = "a very very very very very very large string";
        self.s2 = "another string with quite an amount of text inside it to test the compiler";
    }
}