struct Leaf {
    text: String?; // default null
}

struct Mid {
    leaf: Leaf?; // default null
    flag: Bool?;
}

struct Top {
    mid: Mid?; // default null
    count: Int? = 42;
    active: Bool? = true;
}

contract PartialDeep {
    store: Top;

    init() {
        self.store = Top{
            mid: Mid{
                leaf: null,
                flag: false
            },
            // count & active use defaults
        };
    }

    receive() {}
}