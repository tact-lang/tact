struct OptionalNested {
    f1: Int?;
    f2: Bool?;
    f3: Address?;
    f4: Cell?;
    f5: String?;
}

contract TestOptionalNested {
    inner: OptionalNested;

    init() {
        self.inner = OptionalNested{
            f1: null,
            f2: null,
            f3: null,
            f4: null,
            f5: "not null"
        };
    }
}