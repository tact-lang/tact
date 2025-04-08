contract BoolOpt {
    a: Bool?;
    b: Bool = true;

    init() {
        self.a = false;
        self.b = false;
    }
}