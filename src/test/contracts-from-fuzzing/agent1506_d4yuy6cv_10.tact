contract Test {
    int_field: Int = 10;
    bool_field: Bool = true;
    string_field: String = "tact";
    opt_int: Int? = null;
    opt_bool: Bool? = false;

    init() {
        // override optional
        self.opt_int = 123;
        self.opt_bool = null;
    }
}
// test mix of optional, primitives, and init overrides together in persistent state