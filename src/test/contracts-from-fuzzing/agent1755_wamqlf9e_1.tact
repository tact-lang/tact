struct InnerNested {
    delta: Int;
    epsilon: String;
}

struct Nested {
    alpha: Int;
    beta: String;
    gamma: InnerNested;
}

contract ComplexContract {
    nestedField: Nested;

    init() {
        self.nestedField = Nested{
            alpha: 1,
            beta: "test",
            gamma: InnerNested {
                delta: 2,
                epsilon: "inner"
            }
        };
    }
}