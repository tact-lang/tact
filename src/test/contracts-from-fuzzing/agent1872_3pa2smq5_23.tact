contract InitPartialOptional {
    a: Int;
    s: String?;

    init() {
        self.a = 123;
        // s left null implicitly
    }
}