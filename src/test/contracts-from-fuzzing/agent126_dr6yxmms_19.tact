struct Deep {
    inner1: Int;
    inner2: Bool;
}

contract DeepNestedOptionalField {
    maybeDeep: Deep?;

    init() {
        self.maybeDeep = Deep{
            inner1: 55,
            inner2: false
        };
    }
}