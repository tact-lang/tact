struct Nested {
    num: Int;
    optStr: String?;
    optBool: Bool?;
}

contract TestContract {
    nested: Nested?;

    init() {
        self.nested = Nested{
            num: 1,
            optStr: null,
            optBool: true
        };
    }
}
