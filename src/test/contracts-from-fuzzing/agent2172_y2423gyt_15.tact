contract EmptyOptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        // do not assign anything, expect null defaults
    }
}