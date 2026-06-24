// nested composed optional structs with defaults
struct Leaf {
    foo: Int? = null;
}

struct Middle {
    leaf: Leaf?;
}

struct Root {
    middle: Middle?;
}

contract DeepNestedOptField {
    r: Root;

    init() {
        self.r = Root{middle: null};
    }

    receive() {
        if (self.r.middle != null && self.r.middle!!.leaf != null && self.r.middle!!.leaf!!.foo != null) {
            let _ = self.r.middle!!.leaf!!.foo!!;
        }
    }
}