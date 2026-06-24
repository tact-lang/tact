// Edge case: optional struct containing multiple optional fields inside contract
struct ComplexOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract EmbeddedComplexOpt {
    foo: ComplexOpt? = null;

    init() {
        self.foo = ComplexOpt{
            a: 42,
            b: true,
            c: "Hello",
        };
    }

    receive() {
        self.foo = self.foo;
    }
}