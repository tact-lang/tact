struct Mid {
    f1: Int;
    f2: Bool;
    f3: String;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract ManyNestedStructs {
    storage: Top;

    init() {
        self.storage = Top {
            m1: Mid{ f1: 1, f2: true, f3: "a" },
            m2: Mid{ f1: 2, f2: false, f3: "b" }
        };
    }
}
