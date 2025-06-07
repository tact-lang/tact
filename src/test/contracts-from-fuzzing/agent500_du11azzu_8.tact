struct InnerOpt {
    x: Int?;
}

struct OuterManyOpt {
    a: InnerOpt?;
    b: Int?;
    c: Bool?;
    d: String?;
}

contract MultiOptional {
    state: OuterManyOpt;
    init() {
        self.state = OuterManyOpt{
            a: null,
            b: null,
            c: false,
            d: "some string"
        };
    }
    receive() {}
}