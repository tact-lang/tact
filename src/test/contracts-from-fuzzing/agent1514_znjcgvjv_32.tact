contract OptionalFieldsSomeDefault {
    a: Int? = null;
    b: Bool?;
    c: String? = null;

    init() {
        self.b = null;
    }
}