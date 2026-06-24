struct Inner {
    value: Int;
    flag: Bool;
}

struct Middle {
    inner: Inner;
    optional_val: String?;
}

struct Outer {
    mid: Middle;
    opt_cell: Cell?;
    number: Int;
}

contract NestingChain {
    data: Outer;
    init() {
        self.data = Outer{
            mid: Middle{ inner: Inner{ value: 1, flag: true }, optional_val: null },
            opt_cell: null,
            number: 999,
        };
    }
}
