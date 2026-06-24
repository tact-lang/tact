struct InnerBoolOpt {
    flag: Bool?;
}
contract OptStructField {
    field: InnerBoolOpt?;
    init() {
        self.field = null;
    }
}