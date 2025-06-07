struct InnerMost {
    x: Int;
    y: Int;
}

struct Mid {
    one: InnerMost;
    two: InnerMost;
}

struct Outer {
    m: Mid;
    opt: InnerMost?;
}

contract Combo {
    store: Outer;

    init() {
        self.store = Outer{
            m: Mid{
                one: InnerMost{ x: 1, y: 2 },
                two: InnerMost{ x: 3, y: 4 }
            },
            opt: null
        };
    }
}