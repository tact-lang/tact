struct InnerStruct {
    innerField: Int;
}

struct OuterStruct {
    outerField: Int;
    maybeInner: InnerStruct?;
}

contract OptionalStructField {
    data: OuterStruct;

    init() {
        self.data = OuterStruct{
            outerField: 1,
            maybeInner: null,
        };
    }
}