struct MoreOptional {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract TestContract {
    foo: MoreOptional;

    init() {
        self.foo = MoreOptional{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}