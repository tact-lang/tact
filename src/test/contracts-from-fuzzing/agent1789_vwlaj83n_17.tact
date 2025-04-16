struct OptionalDefaults {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalDefaultsFields {
    val: OptionalDefaults = OptionalDefaults{ a:null, b:null, c:null };
}