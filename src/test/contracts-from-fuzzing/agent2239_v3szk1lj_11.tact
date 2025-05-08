struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalField {
    data: S?;
    init() {
        self.data = null;
    }
}