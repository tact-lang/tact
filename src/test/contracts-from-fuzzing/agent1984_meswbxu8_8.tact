struct DeepAndWide {
    a: Int;
    b: Bool;
    c: Inner1;
    d: Inner2;
    e: Inner3;
}

struct Inner1 {
    v1: Int;
    v2: Int?;
}

struct Inner2 {
    v3: Bool?;
    v4: String;
}

struct Inner3 {
    v5: Address?;
    v6: Cell;
}

contract ComplexFields {
    data: DeepAndWide;

    init() {
        self.data = DeepAndWide{
            a: 5,
            b: false,
            c: Inner1{ v1: 1, v2: null },
            d: Inner2{ v3: true, v4: "foo" },
            e: Inner3{ v5: null, v6: emptyCell() },
        };
    }
}