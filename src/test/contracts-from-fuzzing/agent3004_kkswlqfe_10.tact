struct NestedOptionals {
    ni: Int?;
    ns: String?;
}

struct Wrapper {
    nested: NestedOptionals?;
}

contract OptionalInOptionalStruct {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            nested: null
        };
    }
}