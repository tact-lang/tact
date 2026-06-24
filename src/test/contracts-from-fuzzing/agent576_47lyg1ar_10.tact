struct OptionalInOptional {
    nested: Int?;
}

contract TestContract {
    topOptional: OptionalInOptional?;
    init() {
        self.topOptional = null;
    }
}