// optional primitive in struct, struct itself persistent, and top-level is optional
struct Leaf {
    x: Int?;
    y: Bool;
}

contract OptionalChainTest {
    leafOpt: Leaf?;

    init() {
        self.leafOpt = null;
    }
}