contract OptionalInPersistent {
    opt_int: Int?;
    opt_bool: Bool?;
    opt_str: String?;

    init() {
        self.opt_int = null;
        self.opt_bool = null;
        self.opt_str = null;
    }
}