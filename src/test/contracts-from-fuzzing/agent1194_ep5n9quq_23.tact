struct Combo {
    n: Int;
    b: Bool?;
}

struct NestedNullExample {
    val: Combo?;
}

contract NullInsideStructOptional {
    test: NestedNullExample;

    init() {
        self.test = NestedNullExample{ val: null };
    }
}