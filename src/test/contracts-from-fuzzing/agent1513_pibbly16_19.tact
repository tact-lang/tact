struct TriplyNested {
    one: Int;
    two: Bool;
    three: String;
}

struct Mid {
    tn: TriplyNested;
    midv: String;
}

contract DeepOptional {
    maybe: Mid?;

    init() {
        self.maybe = null;
    }
}