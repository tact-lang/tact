struct Combo {
    simple: Int;
    optNested: Nested?;
    nested: Nested;
}

struct Nested {
    a: Int;
    b: Bool?;
    c: String;
}

contract PersistCombo {
    val: Combo;
    init() {
        self.val = Combo{
            simple: 5,
            optNested: null,
            nested: Nested{
                a: 10,
                b: null,
                c: "abc",
            },
        };
    }
}