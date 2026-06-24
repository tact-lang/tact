struct OptionalBoolInt {
    a: Bool?;
    b: Int?;
}

contract TestContract {
    val: OptionalBoolInt;

    init() {
        self.val = OptionalBoolInt{
            a: null,
            b: 12345
        };
    }
}