struct OptionalDeep {
    inner: Int?;
    addressOpt: Address?;
    nestedOpt: InnerOpt?;
}

struct InnerOpt {
    subVal: Bool;
}

contract ManyNestedOptional {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{
            inner: null,
            addressOpt: null,
            nestedOpt: null,
        };
    }
}