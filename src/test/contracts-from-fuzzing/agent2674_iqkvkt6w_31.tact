contract OptionalAssignedNonNull {
    a: Int?;
    b: String?;
    c: Bool?;

    init() {
        self.a = 42;
        self.b = "nonempty";
        self.c = true;
    }
}