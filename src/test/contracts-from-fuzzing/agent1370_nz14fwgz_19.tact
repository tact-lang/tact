struct InnerA {
    one: Int;
}

struct InnerB {
    two: String;
}

struct Both {
    a: InnerA;
    b: InnerB;
    c: Int;
    d: Bool;
}

contract WrappedBoth {
    content: Both;

    init() {
        self.content = Both{
            a: InnerA{one:1},
            b: InnerB{two:"two"},
            c: 20,
            d: false
        };
    }
}