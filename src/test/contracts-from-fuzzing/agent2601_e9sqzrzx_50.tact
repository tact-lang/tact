struct NextedOptSimple {
    x: Int?;
}

contract OptionalWithinOptional {
    nest: NextedOptSimple?;
    init() {
        self.nest = null;
    }
}