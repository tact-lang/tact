struct OptionalBool {
    f: Bool?;
}

struct NestedWithOptional {
    opt: OptionalBool?;
}

contract ChainOptionalInside {
    f: NestedWithOptional;

    init() {
        self.f = NestedWithOptional{
            opt: OptionalBool{ f: null }
        };
    }
}