struct OptNested {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract ContractOptNested {
    optS: OptNested?;

    init() {
        self.optS = null;
    }
}