struct Deeply {
    i: Int;
}

struct ContainsDeeply {
    d: Deeply?;
}

struct Higher {
    c1: ContainsDeeply;
    c2: ContainsDeeply;
}

contract ManyOptionalStructs {
    store: Higher;

    init() {
        self.store = Higher{
            c1: ContainsDeeply{ d: Deeply{ i: 42 } },
            c2: ContainsDeeply{ d: null },
        };
    }
}
