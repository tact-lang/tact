struct OuterS {
    middle: MiddleS;
}

struct MiddleS {
    inner: InnerS;
}

struct InnerS {
    flag: Bool;
    text: String;
}

contract TripleNestedStructs {
    data: OuterS;

    init() {
        self.data = OuterS{
            middle: MiddleS{
                inner: InnerS{
                    flag: true,
                    text: "nested"
                }
            }
        };
    }
}