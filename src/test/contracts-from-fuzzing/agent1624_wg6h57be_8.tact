struct Leaf { leafVal: Int; }

struct Middle { leafOpt: Leaf?; }

struct Root { midOpt: Middle?; }

contract NestedOptionals {
    data: Root;

    init() {
        self.data = Root{ midOpt: null };
    }
}