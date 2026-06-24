struct Pair {
    first: Int = 1;
    second: Int = 2;
}

contract MultipleStructsAsFields {
    a: Pair;
    b: Pair;
    c: Pair;

    init() {
        self.a = Pair{};
        self.b = Pair{};
        self.c = Pair{};
    }
}