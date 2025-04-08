struct Nested {
    inner1: Int;
    inner2: Bool;
}

contract DeepPersist {
    n: Nested = Nested{inner1: 1, inner2: true};

    init() {
        self.n = Nested{inner1: 42, inner2: false};
    }
}