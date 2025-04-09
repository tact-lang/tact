struct Deep {
    one: Bool;
    two: Bool;
    three: Int;
    four: Int?;
    five: String;
}

contract DeepOptional {
    maybe: Deep?;

    init() {
        self.maybe = null;
    }
}
