struct Child {
    val: Int?;
    str: String?;
}

struct Parent {
    c1: Child;
    c2: Child;
}

contract OptionalNested {
    p: Parent?;

    init() {
        self.p = null;
    }

    receive() {
        self.p = Parent{
            c1: Child{ val: null, str: null },
            c2: Child{ val: 5, str: "x" }
        };
    }
}