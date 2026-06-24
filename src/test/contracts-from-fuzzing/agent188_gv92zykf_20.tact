contract BoolAndOptional {
    flag: Bool;
    maybe: Bool?;
    init() {
        self.flag = true;
        self.maybe = false;
    }
}
