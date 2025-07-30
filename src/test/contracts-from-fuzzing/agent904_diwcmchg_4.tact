struct Combos {
    text: String;
    boolean: Bool;
    coins: Int as coins;
    optionalInt: Int?;
    nested: Nested;
}

struct Nested {
    x: Int as uint32;
    y: Int as uint32;
}

contract ComboContract {
    combos: Combos;

    init() {
        self.combos = Combos{
            text: "test",
            boolean: false,
            coins: ton("1"),
            optionalInt: null,
            nested: Nested{ x: 10, y: 20 }
        };
    }
}