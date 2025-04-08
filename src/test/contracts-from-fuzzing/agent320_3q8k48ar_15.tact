contract ImpliedNulls {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    init() {
        // no explicit assignment, rely on implicit null default
    }
}