struct Inner1 {
    val1: Int;
    opt1: Bool?;
}

struct Inner2 {
    val2: String;
    opt2: Int?;
}

struct TopLevel {
    i1: Inner1;
    i2: Inner2;
    opt3: String?;
}

contract NestedMix {
    store: TopLevel;
    init() {
        self.store = TopLevel{
            i1: Inner1{ val1: 5, opt1: null },
            i2: Inner2{ val2: "hey", opt2: 10 },
            opt3: null
        };
    }
    receive() {
        self.store = TopLevel{
            i1: Inner1{ val1: 6, opt1: true },
            i2: Inner2{ val2: "yo", opt2: null },
            opt3: "done"
        };
    }
}