struct Mid {
    a: Int;
    b: String;
}

struct Top {
    left: Mid;
    right: Mid;
}

contract SymmTest {
    state: Top;

    init() {
        self.state = Top{
            left: Mid{a: 1, b: "L"},
            right: Mid{a: 2, b: "R"}
        };
    }
}