struct Leaf {
    val: Int;
    opt: Bool?;
}

struct Mid {
    leaf: Leaf?;
    other: Int;
}

contract TestContract {
    data: Mid;

    init() {
        self.data = Mid{
            leaf: null,
            other: 42
        };
    }
}