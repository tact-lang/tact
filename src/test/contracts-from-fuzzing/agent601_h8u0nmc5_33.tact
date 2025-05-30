struct Leaf {
    x: Int;
}

struct Nest {
    leaf: Leaf?;
}

contract DefaultNestedOpt {
    data: Nest;

    init() {
        self.data = Nest{
            leaf: null
        };
    }
}
