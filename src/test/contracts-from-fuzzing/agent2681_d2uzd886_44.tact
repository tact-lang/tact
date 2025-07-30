struct InnerS {
    ii: Int;
    bi: Bool?;
}

struct OuterS {
    s: InnerS?;
}

contract OptNestedStructs {
    val: OuterS;
    init() {
        self.val = OuterS{s: null};
    }
}