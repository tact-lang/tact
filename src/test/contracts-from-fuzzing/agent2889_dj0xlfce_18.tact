contract OptionalStructInside {
    optionalField: Bool?;
    nestedOpt: Int?;
    strOpt: String?;

    init() {
        self.optionalField = false;
        self.nestedOpt = 42;
        self.strOpt = null;
    }
}