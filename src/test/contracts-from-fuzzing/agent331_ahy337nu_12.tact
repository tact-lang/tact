struct InnerOne {
    val: Int;
}

struct InnerTwo {
    flag: Bool;
}

struct Container {
    one: InnerOne;
    two: InnerTwo;
}

contract NestedComposite {
    c: Container;

    init() {
        self.c = Container{
            one: InnerOne{ val: 77 },
            two: InnerTwo{ flag: false }
        };
    }
}