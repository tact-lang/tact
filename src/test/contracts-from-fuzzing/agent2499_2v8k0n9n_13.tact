struct N {
    n: Int?;
}

struct M {
    m: N?;
}

struct L {
    l: M?;
}

contract NestedOptionals {
    val: L?;

    init() {
        self.val = null;
    }
}
