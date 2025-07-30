contract OptFields {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalString: String?;
    mandatoryInt: Int = 42;

    init() {}
}