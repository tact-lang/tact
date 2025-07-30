struct OptionalDeep {
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    enabled: Bool;
    count: Int;
}

contract OptionalDeepContract {
    fld: OptionalDeep;

    init() {
        self.fld = OptionalDeep{
            maybeInner: InnerStruct{
                enabled: true,
                count: 777,
            }
        };
    }
}