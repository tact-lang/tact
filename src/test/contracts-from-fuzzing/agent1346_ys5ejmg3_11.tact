struct Small {
    a: Int = 5;
    b: Bool = true;
}

struct Bigger {
    s: Small = Small{};
    c: Int = 42;
}

contract NestedDefaults {
    val: Bigger = Bigger{};
    sum: Int = 0;

    init() {
        self.sum = self.val.s.a + self.val.c;
    }
}
