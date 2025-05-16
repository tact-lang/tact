struct Combo {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalStructField {
    field: Combo?;

    init() {
        self.field = null;
    }
}