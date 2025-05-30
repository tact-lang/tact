struct Leaf {
    lv: Int;
}

struct Middle {
    midVal: Int;
    leafOpt: Leaf?;
}

struct Root {
    rootVal: Int;
    middle: Middle?;
}

contract MultiNestedOptional {
    storage: Root?;
    init() {
        self.storage = null;
    }
}
