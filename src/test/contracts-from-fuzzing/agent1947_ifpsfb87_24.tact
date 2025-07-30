struct RecA {
    val: Int;
}

struct RecB {
    a: RecA?;
}

contract RecursiveLike {
    rb: RecB;
    init() {
        self.rb = RecB{ a: null };
    }
}