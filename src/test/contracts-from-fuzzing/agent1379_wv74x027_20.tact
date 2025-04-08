struct OptionalStruct {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
}

struct Outer {
    s: OptionalStruct?;
}

contract NestedOptionalStructs {
    data: Outer;

    init() {
        self.data = Outer{
            s: null,
        };
    }
}
