struct Abc {
    a: Int;
    b: Bool?;
    c: String;
}

contract InitPartialDefaults {
    f: Abc;

    init() {
        self.f = Abc{ a: 3, c: "yo", b: null };
    }
}
