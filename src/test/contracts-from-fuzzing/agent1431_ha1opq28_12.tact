// Test complex nested optionals in struct in contract storage
struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

struct OuterOpt {
    inner1: InnerOpt?;
    inner2: InnerOpt?;
}

contract TestContract {
    oo: OuterOpt;

    init() {
        self.oo = OuterOpt{
            inner1: InnerOpt{ foo: 1, bar: null },
            inner2: null
        };
    }
}