contract OptDefaults {
    i: Int?;
    b: Bool?;
    a: Address?;
    s: String?;

    // no init(), they're uninitialized => implicitly null
}
