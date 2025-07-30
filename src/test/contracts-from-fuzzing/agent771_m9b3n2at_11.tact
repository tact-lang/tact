contract OptionalVsDefault {
    optInt: Int?;
    defInt: Int = 42;

    init() {
        self.optInt = null;
        self.defInt = 100;
    }
}