contract Test20 {
    f_address: Address;
    f_int64: Int as int64;
    f_utf: String;
    f_bool: Bool;
    f_opt_bool: Bool?;

    init() {
        self.f_address = myAddress();
        self.f_int64 = 42;
        self.f_utf = "test";
        self.f_bool = true;
        self.f_opt_bool = null;
    }

    receive() {}
}