// contract fields bool default false explicitly
contract BoolDefaults {
    a: Bool = false;
    b: Bool?;
    init() {
        self.b = true;
    }
}