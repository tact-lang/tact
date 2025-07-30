// Massive deep optional chain combined with explicit serializations to small bits
struct Bottom {
    foo: Int? as uint5;
    bar: Int? as int6;
}

struct Top {
    left: Bottom;
    right: Bottom;
}

contract OptSmallBits {
    store: Top;

    init() {
        self.store = Top{
            left: Bottom{ foo:null, bar:null },
            right: Bottom{ foo:null, bar:null }
        };
    }
}