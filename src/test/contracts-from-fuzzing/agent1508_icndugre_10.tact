struct S {
    i: Int;
    s: String;
}

contract OptionalField {
    maybeS: S?;

    init() {
        self.maybeS = null;
    }
}
