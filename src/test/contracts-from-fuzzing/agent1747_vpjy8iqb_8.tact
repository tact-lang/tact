struct OuterOpt {
    maybeInt: Int?;
    maybeBool: Bool?;
}

contract NestedOptionals {
    nested: OuterOpt? = null;

    init() {
        self.nested = OuterOpt{ maybeInt: 1, maybeBool: true };
    }
}