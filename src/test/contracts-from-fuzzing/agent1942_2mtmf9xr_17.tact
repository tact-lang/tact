struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: String?;
    d: InnerStruct?;
}
struct InnerStruct {
    x: Int;
}

contract OptionalNestAll {
    f: OptionalNested?;
    init() {
        self.f = null;
    }
}