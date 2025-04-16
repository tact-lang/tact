struct SOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct WrapOpt {
    val: SOpt?;
}

contract NestedOptional {
    v: WrapOpt;

    init() {
        self.v = WrapOpt{val: null};
    }
}