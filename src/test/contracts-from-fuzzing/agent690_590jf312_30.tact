struct OptionalDeep {
    a: Int?;
    b: NestedOptional?;
}
struct NestedOptional {
    c: Bool?;
    d: String?;
}

contract OptionalDepth {
    s: OptionalDeep;

    init() {
        self.s = OptionalDeep{
            a:null,
            b:null
        };
    }
}