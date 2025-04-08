// optional booleans with non-default init
contract BoolOpts {
    a: Bool?;
    b: Bool?;
    init() {
        self.a = true;
        self.b = false;
    }
}