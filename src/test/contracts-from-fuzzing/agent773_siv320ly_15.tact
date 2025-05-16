contract OptionalDefaults {
    field1: Int?;
    field2: Bool?;
    field3: String?;

    init() {
        // do not assign anything, rely on implicit null defaults
    }
}