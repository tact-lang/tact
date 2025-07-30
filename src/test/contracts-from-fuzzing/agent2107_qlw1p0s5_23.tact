struct Base {
    u: Int;
    v: Bool;
}

struct Mid {
    x: Base;
}

struct Top {
    y: Mid;
}

contract NestedComposed {
    storage: Top;

    init() {
        self.storage = Top{
            y: Mid{
                x: Base{
                    u: 1,
                    v: false,
                }
            }
        };
    }
}