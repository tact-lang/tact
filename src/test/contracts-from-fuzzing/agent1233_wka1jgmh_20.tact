struct OptionalDeep {
    a: Int?;
    nested: NestedInner?;
}

struct NestedInner {
    b: String?;
    c: Bool?;
}

contract OptionalDeepStruct {
    state: OptionalDeep;

    init() {
        self.state = OptionalDeep{
            a: null,
            nested: NestedInner{
                b: null,
                c: null
            }
        };
    }
}