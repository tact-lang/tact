contract OptionalAndDefault {
    optionalStr: String? = null;
    optionalInt: Int? = null;
    nonOptWithDef: Int = 42;

    init() {
        self.optionalInt = 88;
    }
}