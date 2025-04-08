struct Pair {
    a: Int;
    b: Int;
}

struct Wrapper {
    wrapped: Pair;
    anotherWrapped: Pair;
    flag: Bool;
}

contract ManyNestedStructs {
    field: Wrapper;

    init() {
        self.field = Wrapper{
            wrapped: Pair{a: 1, b: 2},
            anotherWrapped: Pair{a: 3, b: 4},
            flag: true,
        };
    }
}
