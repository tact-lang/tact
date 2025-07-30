struct OptionalOuter {
    inner: Int?;
}

contract OptionalOptional {
    outer: OptionalOuter?;
    init() {
        self.outer = null;
    }
}