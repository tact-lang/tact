struct DeepOptional {
    f: Int?;
}

contract OptionalContract {
    data: DeepOptional?;

    init() {
        self.data = null;
    }
}