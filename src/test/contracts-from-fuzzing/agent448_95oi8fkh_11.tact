struct ComplexNestedOptional {
    foo: Int?;
    bar: Bool?;
    pair: Pair?;
}

struct Pair {
    left: Int;
    right: Int?;
}

contract ComplexNestedOptionalContract {
    data: ComplexNestedOptional;

    init() {
        self.data = ComplexNestedOptional{
            foo: null,
            bar: null,
            pair: Pair{
                left: 10,
                right: null,
            },
        };
    }

    receive() {}
}