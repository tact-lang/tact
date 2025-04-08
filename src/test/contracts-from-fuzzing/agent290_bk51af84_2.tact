struct Leaf { num: Int; }
struct Middle { leafOpt: Leaf?; }
struct Root { middle: Middle; }

contract Test {
    root: Root;

    init() {
        self.root = Root{ middle: Middle{ leafOpt: Leaf{ num: 7 } } };
    }
}
