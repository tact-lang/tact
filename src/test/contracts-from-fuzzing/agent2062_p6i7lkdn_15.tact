struct Base {
    a: Int;
    b: Bool;
    c: String;
}

contract OptStructInitNull {
    nested: Base?;
    init() { self.nested = null; }
}