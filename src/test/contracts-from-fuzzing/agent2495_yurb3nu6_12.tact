contract LargeStrings {
    str1: String;
    str2: String;

    init() {
        self.str1 = "A very large string indeed, quite verbose just to try...";
        self.str2 = "Another verbose long string exceeding perhaps some limits?";
    }
}