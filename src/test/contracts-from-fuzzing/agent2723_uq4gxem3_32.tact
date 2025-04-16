struct Nesting {
    level1: Int;
    level2: Int?;
}

contract OptNesting {
    n: Nesting?;
    init() {
        self.n = Nesting{ level1: 1, level2: null };
    }
}