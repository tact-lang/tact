struct Child { val: Int; opt: Bool?; }

struct Parent {
    c1: Child;
    c2: Child;
    num: Int;
}

contract NestedStructArrays {
    state: Parent;

    init() {
        self.state = Parent{
            c1: Child{ val: 1, opt: true },
            c2: Child{ val: 2, opt: null },
            num: 42
        };
    }
}