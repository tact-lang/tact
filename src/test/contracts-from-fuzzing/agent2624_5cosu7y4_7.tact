struct Simple {
    x: Int;
}

struct NestedArrayLike {
    item0: Simple;
    item1: Simple;
    item2: Simple;
    item3: Simple;
    item4: Simple;
}

contract ManyNestedSimples {
    store: NestedArrayLike;

    init() {
        self.store = NestedArrayLike{
            item0: Simple{ x: 0 },
            item1: Simple{ x: 1 },
            item2: Simple{ x: 2 },
            item3: Simple{ x: 3 },
            item4: Simple{ x: 4 }
        };
    }
}
