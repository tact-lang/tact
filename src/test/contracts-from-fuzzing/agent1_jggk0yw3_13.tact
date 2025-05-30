struct InnerOptional {
    num: Int?;
}

contract OptionalOuter {
    field: InnerOptional?;

    init() {
        self.field = null;
    }
}