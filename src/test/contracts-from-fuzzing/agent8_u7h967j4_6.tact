struct InnerOpt {
    foo: Int?;
}

struct OuterOpt {
    bar: InnerOpt?;
}

contract NestedOptionalStructs {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            bar: InnerOpt{ foo: 42 }
        };
    }
}