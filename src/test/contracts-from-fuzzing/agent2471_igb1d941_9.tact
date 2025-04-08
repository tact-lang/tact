contract InlineOptional {
    someOpt: Int?;
    anotherOpt: Bool?;

    init() {
        self.someOpt = 123;
        self.anotherOpt = null;
    }
}