struct DeepOptional {
    inside: Int?;
}

contract OuterOptional {
    thing: DeepOptional?;

    init() {
        self.thing = null;
    }
}