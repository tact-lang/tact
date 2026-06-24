struct Pairs {
    one: Int;
    two: Int;
}

contract ComplexOptional {
    maybePairs: Pairs?;
    maybeBool: Bool?;
    maybeInt: Int?;

    init() {
        self.maybePairs = null;
        self.maybeBool = null;
        self.maybeInt = null;
    }
}