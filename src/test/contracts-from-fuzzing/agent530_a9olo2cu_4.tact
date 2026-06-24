struct ComplexOpt {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptTest {
    field: ComplexOpt;

    init() {
        self.field = ComplexOpt{
            i: null,
            b: true,
            s: "hello"
        };
    }
}
