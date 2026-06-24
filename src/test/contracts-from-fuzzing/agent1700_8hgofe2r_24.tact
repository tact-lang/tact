struct Combo {
    foo: Int;
    bar: Bool?;
    baz: String;
    qux: Int?;
}

contract TestContract {
    c: Combo;

    init() {
        self.c = Combo{ foo:1, bar:null, baz:"x", qux:99 };
    }
}