contract OptionalStringInt {
    opt_str: String?;
    opt_int: Int?;

    init() {
        self.opt_str = "hello";
        self.opt_int = 42;
    }
}