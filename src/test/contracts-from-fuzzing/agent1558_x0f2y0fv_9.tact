contract AllOptionalsUninitialized {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;

    init() {
        // leave all uninitialized, should be null implicitly
    }
}