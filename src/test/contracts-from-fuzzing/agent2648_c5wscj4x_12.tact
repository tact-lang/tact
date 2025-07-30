struct Nested {
    i: Int;
    s: String;
    opt_s: String?;
    opt_i: Int?;
}

contract OptionalStructs {
    opt_nested: Nested?;

    init() {
        self.opt_nested = null;
    }
}