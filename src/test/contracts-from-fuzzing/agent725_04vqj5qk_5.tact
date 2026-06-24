struct InnerOne {
    i: Int;
}

struct InnerTwo {
    s: String;
}

contract MultipleOptionalStructs {
    a: InnerOne?;
    b: InnerTwo?;

    init() {
        self.a = null;
        self.b = null;
    }
}