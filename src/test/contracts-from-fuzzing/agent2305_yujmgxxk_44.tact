struct OptNested {
    a: InnerOne?;
}

struct InnerOne {
    b: InnerTwo?;
}

struct InnerTwo {
    c: Int?;
}

contract TestOptNested {
    s: OptNested;

    init() {
        self.s = OptNested{
            a: null
        };
    }
}
