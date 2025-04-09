struct InnerLevel {
    a: Int;
}

struct MiddleLevel {
    b: Bool?;
    c: InnerLevel?;
}

struct TopLevel {
    d: Bool;
    e: MiddleLevel;
}

contract TestContract {
    top: TopLevel;
    init() {
        self.top = TopLevel{
            d: false,
            e: MiddleLevel{
                b: null,
                c: null
            }
        };
    }
}
