struct OptNested {
    opt_int: Int?;
    opt_bool: Bool?;
    opt_str: String?;
}

contract TestContract {
    opt_nested: OptNested?;

    init() {
        self.opt_nested = null;
    }
}