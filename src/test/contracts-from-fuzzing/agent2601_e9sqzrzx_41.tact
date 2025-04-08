struct InnerMost {
    innermost: Int;
}
struct Med {
    middle: InnerMost;
}
struct Top {
    top: Med;
}

contract NestedDeep {
    t: Top;
    init() {
        self.t = Top{ top: Med{ middle: InnerMost{ innermost: 1 } } };
    }
}