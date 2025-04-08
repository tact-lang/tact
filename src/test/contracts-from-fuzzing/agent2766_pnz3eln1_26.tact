struct OptionalBoolInt {
    b: Bool?;
    i: Int?;
}

contract OptBoolIntContract {
    val: OptionalBoolInt;

    init() {
        self.val = OptionalBoolInt{
            b: null,
            i: null,
        };
    }
}