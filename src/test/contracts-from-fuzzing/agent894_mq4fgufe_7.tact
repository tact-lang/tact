struct Child {
    f1: Int;
    f2: Bool;
}

struct Parent {
    s1: Child;
    s2: Child;
    s3: Child;
}

contract StructArrayImitation {
    big: Parent;

    init() {
        self.big = Parent{
            s1: Child{ f1: 1, f2: false },
            s2: Child{ f1: 2, f2: true },
            s3: Child{ f1: 3, f2: false }
        };
    }
}