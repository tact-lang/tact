contract OptionalDefaults {
    optionalInt: Int? = null;
    optionalBool: Bool? = null;
    optionalString: String? = null;
    optionalAddress: Address? = null;
    optionalCell: Cell? = null;
    optionalSlice: Slice? = null;

    init() {
        // leave as defaults
    }
}