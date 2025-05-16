struct OuterS {
    a: Int;
    b: InnerS;
}

struct InnerS {
    c: Int;
    d: String;
}

contract ReverseOrderFields {
    field: OuterS;
    init() {
        self.field = OuterS{
            a: 1,
            b: InnerS{
                c: 2,
                d: "str"
            }
        };
    }
}
