struct InnerMost {
    x: String;
}

struct MiddleMid {
    m: Int?;
    im: InnerMost;
}

struct OuterMost {
    mid: MiddleMid;
    flag: Bool;
}

contract ComplexNestOptional {
    storage: OuterMost;

    init() {
        self.storage = OuterMost{
            mid: MiddleMid{ m: null, im: InnerMost{ x: "hello" } },
            flag: true
        };
    }
}