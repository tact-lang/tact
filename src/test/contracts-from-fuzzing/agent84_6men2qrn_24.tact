struct InnerA {
    a: Int;
}

struct InnerB {
    b: Bool;
}

struct Both {
    one: InnerA?;
    two: InnerB?;
}

contract TwoOpts {
    data: Both;

    init() {
        self.data = Both{
            one: null,
            two: null,
        };
    }
}