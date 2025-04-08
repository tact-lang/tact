struct NestedOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    nested: NestedOpt;

    init() {
        self.nested = NestedOpt{
            a: null,
            b: true,
            c: "Hello"
        };
    }
}
