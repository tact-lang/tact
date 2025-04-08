struct NestedBoolOpt {
    foo: Bool?;
}

struct OuterOptions {
    intOpt: Int?;
    boolOpt: Bool?;
    structOpt: NestedBoolOpt?;
}

contract ManyLayeredOptionals {
    data: OuterOptions;

    init() {
        self.data = OuterOptions{
            intOpt: 9,
            boolOpt: false,
            structOpt: NestedBoolOpt{foo:true}
        };
    }
}