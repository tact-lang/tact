struct OptionalNested {
    inner: Int?;
    alt: Bool?;
}

struct Wrap {
    optionalPart: OptionalNested;
    fixed: Int;
}

contract TestContract {
    data: Wrap;

    init() {
        self.data = Wrap{
            optionalPart: OptionalNested{ inner: null, alt: true },
            fixed: 42
        };
    }
}