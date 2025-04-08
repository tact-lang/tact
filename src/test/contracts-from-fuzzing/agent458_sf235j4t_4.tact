struct NestedOptional {
    maybeInt: Int?;
    maybeBool: Bool?;
    maybeStr: String?;
}

contract StructWithOptionals {
    s: NestedOptional;

    init() {
        self.s = NestedOptional{
            maybeInt: 7,
            maybeBool: false,
            maybeStr: null
        };
    }
}