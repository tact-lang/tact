struct S {
    a: Int;
    b: Int;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
}

contract OptionalComposite {
    value: S?;

    init() {
        self.value = null;
    }
}
