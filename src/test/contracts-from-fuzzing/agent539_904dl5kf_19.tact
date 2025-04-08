struct OuterMost {
    inn: InnerMost;
}

struct InnerMost {
    s: String;
}

contract OutIn {
    v: OuterMost;
    init() {
        self.v = OuterMost {
            inn: InnerMost {
                s: "deep"
            }
        };
    }
}