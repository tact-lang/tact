struct OptionalNested {
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    maybeStr: String?;
    maybeNumber: Int?;
}

contract TestOptionalNested {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            maybeInner: InnerStruct{
                maybeStr: null,
                maybeNumber: 777
            }
        };
    }
}