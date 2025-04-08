struct OneField { x: Int; }

struct Wrapper {
    val: OneField;
}

struct Outer {
    field: Wrapper;
}

contract LongChain {
    nest: Outer;

    init() {
        self.nest = Outer{ field: Wrapper{ val: OneField{ x: 123 } } };
    }
}