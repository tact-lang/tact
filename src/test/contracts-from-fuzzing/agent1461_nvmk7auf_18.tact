contract ImplicitNulls {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Cell?;

    init() {
        // assign nothing - test implicit null default persistent init
    }
}