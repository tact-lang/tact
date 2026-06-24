struct OuterOpt {
    o: Int?;
}

contract NullOuter {
    field: OuterOpt?;

    init() {
        self.field = null;
    }
}
