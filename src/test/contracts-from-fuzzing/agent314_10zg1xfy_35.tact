// deeply nested mix of optionals, defaults, primitives
struct Leaf {
    a: Bool?;
}

struct Mid1 {
    leaf: Leaf?;
    txt: String;
}

struct Mid2 {
    m1: Mid1?;
    count: Int;
}

contract VeryDeepMixed {
    val: Mid2?;
    init() {
        self.val = null;
    }
}