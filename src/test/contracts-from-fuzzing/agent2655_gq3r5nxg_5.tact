struct OptionalDeepStruct {
    d: Int?;
    nested_opt: NestedOpt?;
}

struct NestedOpt {
    val: Bool?;
    message: String?;
}

contract OptionalNested {
    s: OptionalDeepStruct;

    init() {
        self.s = OptionalDeepStruct{
            d: null,
            nested_opt: null,
        };
    }
}