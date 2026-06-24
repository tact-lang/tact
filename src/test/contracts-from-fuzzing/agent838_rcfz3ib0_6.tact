struct Child {
    info: String?;
}

struct Parent {
    a: Child?;
    b: Child?;
}

contract OptionalsNested {
    p: Parent;

    init() {
        self.p = Parent{
            a: null,
            b: Child{ info: null }
        };
    }
}