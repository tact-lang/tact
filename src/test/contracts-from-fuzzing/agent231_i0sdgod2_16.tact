// test contract with ONLY optional persistent fields
contract OnlyOpts {
    a: Int?;
    b: Bool?;
    c: String?;

    init() {
        // no explicit assigns, all default to null
    }
}