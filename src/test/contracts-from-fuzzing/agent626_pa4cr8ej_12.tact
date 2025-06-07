struct Flat {
    a: Int;
    b: Bool;
}

struct Middle {
    f: Flat;
    d: Int;
}

struct Top {
    m: Middle;
    extra: Bool;
}

contract Layering {
    store: Top;

    init() {
        self.store = Top{
            m: Middle{ f: Flat{ a: 8, b: true }, d: 99 },
            extra: false
        };
    }
}