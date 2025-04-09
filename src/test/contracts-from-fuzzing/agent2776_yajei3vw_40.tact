struct NestedX {
    val: Int;
}

struct Wrapper {
    val: NestedX;
}

contract OptOuter {
    outer: Wrapper?;

    init() {
        self.outer = null;
    }
}
