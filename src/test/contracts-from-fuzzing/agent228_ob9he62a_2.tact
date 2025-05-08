struct InnerMost {
    leaf: Int;
}

struct InnerOptional {
    maybeLeaf: InnerMost?;
}

struct Middle {
    left: InnerOptional;
    right: InnerMost;
}

struct Outer {
    node: Middle?;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            node: Middle{
                left: InnerOptional{ maybeLeaf: null },
                right: InnerMost{ leaf: 3 }
            }
        };
    }
}