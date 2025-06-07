struct ComplexOptionStruct {
    maybeInt: Int?;
    maybeInner: InnerOpt?;
}

struct InnerOpt {
    inside: Bool?;
}

contract ComplexOptionals {
    data: ComplexOptionStruct;

    init() {
        self.data = ComplexOptionStruct{
            maybeInt: null,
            maybeInner: null
        };
    }
}