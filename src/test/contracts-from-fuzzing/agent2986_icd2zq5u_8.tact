struct OptNested {
    name: String?;
    count: Int?;
    active: Bool?;
}

contract ContractOptNested {
    onest: OptNested?;

    init() {
        self.onest = null;
    }
}