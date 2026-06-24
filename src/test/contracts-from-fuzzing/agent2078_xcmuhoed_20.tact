struct Deep {
    s: String = "text";
    b: Bool = true;
    n: Int = 42;
}

struct Wrapper {
    w: Deep = Deep{ s: "deeptext", b: false, n: 100 };
}

contract NestedTest {
    w1: Wrapper = Wrapper{ w: Deep{ s: "x", b: true, n: 1 } };
    w2: Wrapper = Wrapper{ w: Deep{ s: "y", b: false, n: 2 } };
    init() {}
}