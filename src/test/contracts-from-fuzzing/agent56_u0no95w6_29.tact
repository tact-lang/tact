contract ContractWithStringAndOptional {
    name: String;
    description: String?;

    init() {
        self.name = "name";
        self.description = null;
    }
}