struct InnerMost {
    deepValue: Int;
}

struct Middle {
    option: InnerMost?;
}

struct Outer {
    middle: Middle;
}

contract NestedOptional {
    data: Outer;

    init() {
        self.data = Outer{ middle: Middle{ option: null } };
    }
}