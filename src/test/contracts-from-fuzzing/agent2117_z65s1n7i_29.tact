struct ContradictorySerialization {
    a: Int as uint8 = 1000;
}

contract SerializeConstOverflow {
    storage: ContradictorySerialization;
    init() {
        self.storage = ContradictorySerialization{};
    }
}