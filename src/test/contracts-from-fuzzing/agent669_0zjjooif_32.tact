struct OptRem {
    prefix: Int as uint32;
    rest: Slice?;
}

contract OptionalRemSlice {
    val: OptRem;

    init() {
        self.val = OptRem{
            prefix: 123,
            rest: null
        };
    }
}