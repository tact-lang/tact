struct Sibling1 {
    val1: Int;
}

struct Sibling2 {
    val2: Bool;
}

struct Wrapper {
    s1: Sibling1;
    s2: Sibling2;
}

contract NestedSiblings {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            s1: Sibling1{ val1: 5 },
            s2: Sibling2{ val2: true }
        };
    }
}