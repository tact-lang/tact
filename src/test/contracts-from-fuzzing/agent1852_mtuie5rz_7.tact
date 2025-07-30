contract StringFields {
    name: String;
    description: String;

    init() {
        self.name = "Test";
        self.description = "A persistent description string";
    }
}