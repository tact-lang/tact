struct OptionalInOptional {
    inside: String?;
}

contract OptOpt {
    data: OptionalInOptional?;

    init() {
        self.data = null;
    }
}