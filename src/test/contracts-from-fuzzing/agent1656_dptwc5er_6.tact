struct OptionalsTuple {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct NestedMany {
    f1: OptionalsTuple;
    f2: OptionalsTuple;
    f3: OptionalsTuple;
}

contract ManyNestedOptionals {
    storage: NestedMany;

    init() {
        self.storage = NestedMany{
            f1: OptionalsTuple{ a: null, b: null, c: null },
            f2: OptionalsTuple{ a: 5, b: true, c: null },
            f3: OptionalsTuple{ a: null, b: false, c: "test" },
        };
    }
}
