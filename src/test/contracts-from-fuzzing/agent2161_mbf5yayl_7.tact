// optional at top, nested struct inside optional
struct Nested {
    x: Int;
    y: Bool;
}

contract OptStructField {
    optNested: Nested?;

    init() {
        self.optNested = null;
    }
}