struct S {
    count: Int = 0;
}

contract OptionalStructField {
    maybeS: S?;

    init() {
        self.maybeS = null;
    }
}