struct BigNestedOpt {
    a: Inner?;
    b: Inner?;
    c: Inner?;
}

struct Inner {
    val1: Int;
    val2: String?;
    val3: Bool;
}

contract ComplexOptContract {
    store: BigNestedOpt;

    init() {
        self.store = BigNestedOpt{
            a: Inner{ val1: 1, val2: "a", val3: true },
            b: null,
            c: Inner{ val1: 3, val2: null, val3: false }
        };
    }
}