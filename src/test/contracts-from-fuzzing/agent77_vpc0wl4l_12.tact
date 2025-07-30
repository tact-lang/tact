contract OptionalInits {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;

    receive() {
        self.a = 1;
        self.b = true;
        self.c = "wow";
    }
}
