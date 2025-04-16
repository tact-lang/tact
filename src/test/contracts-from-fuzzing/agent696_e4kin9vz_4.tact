struct OptionalDeep {
    nestedOpt: Nested?;
}

struct Nested {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract DeepOptionals {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{nestedOpt: null};
    }
}
