contract StringsStorage {
    a: String = "one";
    b: String = "two";
    c: String = "three";
    d: String = "four";
    e: String;

    init() {
        self.e = "five";
    }
}