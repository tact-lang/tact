struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

struct OuterOpt {
    nestedOpt: InnerOpt?;
    count: Int;
}

contract NestedOptionalField {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
          nestedOpt: null,
          count: 5
        };
    }
}