// deeply nested defaulted optional structs with assignment 
struct Leaf {
    a: Int? = null;
}

struct Middle {
    leaf: Leaf?=null;
}

struct Root {
    mid: Middle?=null;
}

contract DefaultNestedInit {
    r: Root?=null;

    init() {
        self.r = null;
    }
}