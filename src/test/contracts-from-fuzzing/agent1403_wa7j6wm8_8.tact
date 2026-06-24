contract OptionalPrimitive {
    opt_int: Int?;
    opt_bool: Bool?;
    opt_string: String?;

    init() {
        self.opt_int = null;
        self.opt_bool = null;
        self.opt_string = null;
    }
}