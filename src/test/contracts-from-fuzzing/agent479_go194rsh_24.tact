struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract OptionalBig {
    info: S?;

    init() {
        self.info = null;
    }
}