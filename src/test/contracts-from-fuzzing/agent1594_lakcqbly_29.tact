contract FieldsAndNested {
    a: Int;
    b: Bool;
    c: String;
    d: Nested;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hi";
        self.d = Nested{ f: 42 };
    }
}

struct Nested {
    f: Int;
}