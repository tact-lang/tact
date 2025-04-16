struct AllOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    optField: AllOptional?;

    init() {
        self.optField = null;
    }
}