struct NestedOptionals {
    s: Sub?;
}

struct Sub {
    val: Int?;
}

contract OptNested {
    n: NestedOptionals;

    init() {
        self.n = NestedOptionals{ s: null };
    }
}
