// deep nesting + many optionals edge case
struct Base {
    x: Int;
}
struct Mid {
    a: Base?;
    b: Base?;
    c: Base?;
}
struct Top {
    m1: Mid?;
    m2: Mid?;
}

contract DeepAndWide {
    store: Top;

    init() {
        self.store = Top{
            m1: null,
            m2: Mid{
                a: Base{ x: 1 },
                b: null,
                c: Base{ x: 3 },
            }
        };
    }
}