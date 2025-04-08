// contract with all optional fields in nested optional struct
struct OptNested {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OuterOpt {
    nested: OptNested?;

    init() {
        self.nested = null;
    }
}
