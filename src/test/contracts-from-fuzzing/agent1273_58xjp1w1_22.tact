contract LongStrings {
    shortStr: String;
    mediumStr: String;
    longStr: String;

    init() {
        self.shortStr = "a";
        self.mediumStr = "abcdefghijklmnopqrstuvwxyz";
        self.longStr = "abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz";
    }
}