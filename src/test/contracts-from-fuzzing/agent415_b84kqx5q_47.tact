contract MixedInitialized {
    a: Int;
    b: Bool = false;
    c: String;

    init() {
        self.a = 5;
        self.c = "yo";
    }
}