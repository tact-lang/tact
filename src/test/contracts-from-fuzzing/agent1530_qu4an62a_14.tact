contract OptionalDefaults {
    opt_int: Int?;
    opt_bool: Bool?;

    init() {
        self.opt_int = 5;
        self.opt_bool = null;
    }
}