struct ComplexA {
    one: Int?;
    two: Bool;
    three: String;
}

struct ComplexB {
    first: ComplexA;
    second: String;
    third: Int;
}

contract ComplexMixedContract {
    store: ComplexB;

    init() {
        self.store = ComplexB{
            first: ComplexA{
                one: null,
                two: true,
                three: "hi",
            },
            second: "there",
            third: 999,
        };
    }
}