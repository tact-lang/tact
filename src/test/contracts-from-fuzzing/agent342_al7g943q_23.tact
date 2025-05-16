contract SerializeStrings {
    a: String = "hi";
    b: String = "there";

    init() {
        self.a = "bye";
        self.b = "now";
    }
}
