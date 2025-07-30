contract TestContract {
    int_field: Int = 42;
    bool_field: Bool = true;
    string_field: String = "hi";
    opt_int: Int? = null;
    opt_bool: Bool? = false;
    opt_string: String? = null;

    init() {
        self.int_field = 1;
        self.bool_field = false;
        self.string_field = "test";
        self.opt_int = 2;
        self.opt_bool = true;
        self.opt_string = "hello";
    }
}
