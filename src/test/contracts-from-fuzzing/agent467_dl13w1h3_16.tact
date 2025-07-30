// Struct with nested optional string and primitives
struct ComplexOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapOpt {
    inside: ComplexOpt?;
}

contract NestedOptionalInside {
    val: WrapOpt;

    init() {
        self.val = WrapOpt{inside: null};
    }
}
