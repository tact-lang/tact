struct Leaf {
    value: Int;
}

struct Container {
    leaf: Leaf?;
    name: String;
}

contract NestedOptionalOmit {
    c: Container;

    init() {
        self.c = Container{
            name: "skip"
        };
    }
}