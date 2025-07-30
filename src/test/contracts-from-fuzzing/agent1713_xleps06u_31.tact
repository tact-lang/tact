struct OptionalWrapper {
    wrapped: Int?;
}

contract DoubleAssignment {
    val: OptionalWrapper;

    init() {
        self.val = OptionalWrapper{ wrapped: null };
        self.val = OptionalWrapper{ wrapped: 42 };
    }
}