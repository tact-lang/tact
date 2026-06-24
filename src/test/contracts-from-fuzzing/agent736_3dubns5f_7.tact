struct OptionalDeep {
    nestedOpt: InnerStruct?;
}

struct InnerStruct {
    inside: Int;
    moreInside: String?;
}

contract OptionalDeepField {
    s: OptionalDeep;

    init() {
        self.s = OptionalDeep{ nestedOpt: null };
    }
}