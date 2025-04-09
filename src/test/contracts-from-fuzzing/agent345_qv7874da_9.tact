struct Inner {
    optionalInt: Int?;
    optionalBool: Bool?;
    optionalAddress: Address?;
}

contract OptionalStructTest {
    stored: Inner;

    init() {
        self.stored = Inner{
            optionalInt: null,
            optionalBool: true,
            optionalAddress: null
        };
    }
}