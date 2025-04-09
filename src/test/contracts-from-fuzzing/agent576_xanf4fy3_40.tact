struct ComplexOpt {
    a: Bool?;
    b: Int?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Int = 8;
}

contract ImplicitAllNull {
    val: ComplexOpt;

    init() {
        self.val = ComplexOpt{};
    }
}
