struct ABC {
    a: Int;
}

struct DEF {
    b: Int;
    c: ABC;
}

struct GHI {
    d: DEF;
    e: Int;
}

contract NestedMany {
    store: GHI;
    init() {
        self.store = GHI{
            d: DEF{
                b: 5,
                c: ABC{ a: 1}
            },
            e: 7
        };
    }
}
