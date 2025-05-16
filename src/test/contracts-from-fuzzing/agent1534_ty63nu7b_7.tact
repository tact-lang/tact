struct NestedOptional {
    inner1: Int?;
    inner2: Bool?;
}

struct OuterOpt {
    nested: NestedOptional?;
}

contract OptionalOfStruct {
    payload: OuterOpt;
    init() {
        self.payload = OuterOpt{nested: null};
    }
}