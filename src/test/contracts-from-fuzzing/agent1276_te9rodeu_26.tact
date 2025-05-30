struct Outer {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
}

contract OptFields {
    outer: Outer?;

    init() {
        self.outer = null;
    }
}