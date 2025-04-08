struct Child {
    a: Int;
}

struct MidLevel {
    b: Child;
}

struct TopLevel {
    c: MidLevel;
}

contract NestedStructOpt {
    nested: TopLevel?;

    init() {
        self.nested = null;
    }
}