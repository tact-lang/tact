struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

struct OuterOpt {
    a: Int?;
    b: String?;
    nested: InnerOpt?;
}

contract TestContract {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            a: null,
            b: null,
            nested: null
        };
    }

    receive() {}
}