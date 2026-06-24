struct InnerOpt {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

struct Wrapper {
    nested: InnerOpt;
    count: Int;
}

contract ManyOptionals {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            nested: InnerOpt{
                optInt: null,
                optBool: null,
                optStr: null,
            },
            count: 999,
        };
    }
}
