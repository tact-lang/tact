struct Innermost {
    innerVal: Int;
}
struct Second {
    s: Innermost;
}
struct Top {
    t: Second;
}

contract MultilevelLanes {
    lanes: Top;

    init() {
        self.lanes = Top{ t: Second{ s: Innermost{ innerVal: 1 } } };
    }
}
